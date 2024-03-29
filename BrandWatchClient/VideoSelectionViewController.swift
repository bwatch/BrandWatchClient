//
//  VideoSelectionViewController.swift
//  BrandWatchClient
//
//  Created by Niaz Jalal on 10/21/14.
//  Copyright (c) 2014 BrandWatch. All rights reserved.
//

import UIKit

class VideoSelectionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var VideoSelectionTitleMenuButton: UIButton!
    @IBOutlet weak var videoSelectionTableView: UITableView!
    
    var videoSelectionView: UIView!
    
    var campaign: Campaign!
    
    var videos: [Video]! = [Video]()
    
    var selectedRowsArray: NSMutableArray = []
    
    var settingsVC: SettingsViewController!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Retrieve a list of uploaded videos for the User's channel
        CampaignService.sharedInstance.getVideos(){ (videos, error) -> Void in
            if error == nil {
                self.videos = videos
                
                //println("Videos1: \(videos)")
            }
        }
        
        var campaign = CampaignService.sharedInstance.getActiveWriteCampaign()!
        
        self.selectedRowsArray = []
        
        if let videoIds = campaign.video_ids? {
            for videoId in videoIds {
                self.selectedRowsArray.addObject(videoId)
            }
        }
        
        NSTimer.scheduledTimerWithTimeInterval(7, target: self, selector: "reloadVideos", userInfo: nil, repeats: false)

        var nib = UINib(nibName: "VideoSelectionView", bundle: nil)
        
        var objects = nib.instantiateWithOwner(self, options: nil)
        
        videoSelectionView = objects[0] as UIView
        view.addSubview(videoSelectionView)
        videoSelectionView.addSubview(videoSelectionTableView)
        
        // Do any additional setup after loading the view.
        videoSelectionTableView.dataSource = self
        videoSelectionTableView.delegate = self
        
        var videoCellNib = UINib(nibName: "VideoCell", bundle: nil)
        videoSelectionTableView.registerNib(videoCellNib, forCellReuseIdentifier: "VideoCell")
        
        videoSelectionTableView.estimatedRowHeight = UITableViewAutomaticDimension
        //videoSelectionTableView.rowHeight = UITableViewAutomaticDimension
        
        constructUI()
        
        videoSelectionTableView.reloadData()
    }
    
    func constructUI() {
        
        // Setup menu button
        self.VideoSelectionTitleMenuButton.backgroundColor = UIColor.BWRed()
        self.VideoSelectionTitleMenuButton.layer.borderWidth = 2
        self.VideoSelectionTitleMenuButton.layer.borderColor = UIColor.BWDarkBlue().CGColor
        self.VideoSelectionTitleMenuButton.layer.cornerRadius = 8
        self.VideoSelectionTitleMenuButton.setTitleColor(UIColor.BWOffWhite(), forState: UIControlState.Normal)
        self.VideoSelectionTitleMenuButton.titleLabel?.font = fBWMenloBold18
        
        self.videoSelectionView.backgroundColor = UIColor.clearColor()
        self.videoSelectionView.backgroundColor = UIColor.BWOffWhite()
        
        self.videoSelectionView.backgroundColor = UIColor.BWOffWhite()
        self.videoSelectionTableView.backgroundColor = UIColor.BWOffWhite()
    }
    
    func reloadVideos() {
        
        self.videoSelectionTableView.reloadData()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return videos.count ?? 1
    }
    

    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //var cell = videoSelectionTableView.dequeueReusableCellWithIdentifier("VideoCell") as UITableViewCell
        
        //var cell: UITableViewCell! = UITableViewCell()
        
//        var cell:UITableViewCell = videoSelectionTableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
//        
        var videoCell = videoSelectionTableView.dequeueReusableCellWithIdentifier("VideoCell")
        as VideoCell
        
        videoCell.contentView.layoutSubviews()
        
//        cell.textLabel.numberOfLines = 0;
//        cell.textLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
//        cell.textLabel.frame = CGRectMake(20, 10, 20, 200)
//        var myFont: UIFont = UIFont(name: "Arial", size: 14.0)!
//        cell.textLabel.font  = myFont;
        var video = videos[indexPath.row]
        videoCell.name.text = video.name!
        videoCell.name.preferredMaxLayoutWidth = 300
        videoCell.name.lineBreakMode = NSLineBreakMode.ByWordWrapping
        videoCell.name.font = fBWMenloBold15
        

        var videoId = videos[indexPath.row].video_id!

        videoCell.thumbnailImageView.setImageWithURL(NSURL(string: video.thumbnailUrl!))
        if selectedRowsArray.containsObject(videoId) {
            videoCell.selectImageView.image = UIImage(named: "checked_BWRed26.png")
        
        } else {
            videoCell.selectImageView.image = UIImage(named: "unchecked_BWRed26.png")
        }
        
        //cell.imageView.image = UIImage(named: "unchecked.png")
        var checkboxTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("handleChecking:"))
        videoCell.selectImageView.addGestureRecognizer(checkboxTap)
        videoCell.selectImageView.userInteractionEnabled = true
        
        //cell.contentView.addSubview(UIView(frame: CGRect(x: 50, y: 100, width: 300, height: 20)))
        
        return videoCell
    }
    
    func handleChecking(tapRecognizer: UITapGestureRecognizer) {
        println("Tapped")
        
        var taplocation: CGPoint = tapRecognizer.locationInView(videoSelectionTableView)
        
        var tappedIndexPath: NSIndexPath = videoSelectionTableView.indexPathForRowAtPoint(taplocation)!
        
        var videoId = videos[tappedIndexPath.row].video_id!
        
        if selectedRowsArray.containsObject(videoId) {
            selectedRowsArray.removeObject(videoId)
            
        } else {
            selectedRowsArray.addObject(videoId)
        }
        
        videoSelectionTableView.reloadData()
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {

        // This is a workaround to prevent showing a bad video ID 
        // returned by YouTube. Need to replace in the model later
        var badRow : Int!
        for var i = 0; i < videos.count; i++ {
            if videos[i].video_id == "cx1Rjz8sPYY" {
                badRow = i
            }
        }
        
        if indexPath.row == badRow {
            return 0
        }

 
       
        return CGFloat(250)
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func videoListMenuTapped(sender: UIButton) {
        var styleItems = [RWDropdownMenuItem]()
        
        if selectedRowsArray.count > 0 {
            styleItems.append(
                RWDropdownMenuItem(text:"Continue (\(selectedRowsArray.count))", image: UIImage(named: "checklist_BWOffWhite25.png"), action:{
                    
                    println("loading settings view (edit)")
                    //selected videos
                    var selectedVideos = [String]()
                    for videoId in self.selectedRowsArray {
                        selectedVideos.append(videoId as String)
                    }
                    var campaign = CampaignService.sharedInstance.getActiveWriteCampaign()
                    campaign?.video_ids = selectedVideos
                    
                    //Make all the changes in CampaignService
                    self.settingsVC.loadCampaignTargets()
                    self.dismissViewControllerAnimated(true, completion: nil)
                })
            )
        }
        
        styleItems.append(
            RWDropdownMenuItem(text:"Cancel", image: UIImage(named: "cancel_BWOffWhite25.png"), action:{
                println("cancelling...")
                
                self.dismissViewControllerAnimated(true, completion: nil)
            })
        )
        
        RWDropdownMenu.presentFromViewController(self, withItems: styleItems, align: RWDropdownMenuCellAlignment.Left, style: RWDropdownMenuStyle.Translucent, navBarImage: nil, completion: nil)
    }
}
