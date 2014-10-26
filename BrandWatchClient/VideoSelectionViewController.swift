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
    
    var videos: [Video]! = [Video]()
    
    var selectedRowsArray: NSMutableArray = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        // Retrieve a list of uploaded videos for the User's channel
        CampaignService.getVideos(){ (videos, error) -> Void in
            if error == nil {
                self.videos = videos
                
                //println("Videos1: \(videos)")
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
        
        videoSelectionTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        videoSelectionTableView.reloadData()
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
        
        var cell:UITableViewCell = videoSelectionTableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        cell.textLabel.frame = CGRectMake(20, 10, 20, 200)
        var myFont: UIFont = UIFont(name: "Arial", size: 14.0)!
        cell.textLabel.font  = myFont;
        cell.textLabel.text = videos[indexPath.row].name!

        if selectedRowsArray.containsObject(indexPath.row) {
            cell.imageView.image = UIImage(named: "checked.png")
            
        } else {
            cell.imageView.image = UIImage(named: "unchecked.png")
        }
        
        //cell.imageView.image = UIImage(named: "unchecked.png")
        var checkboxTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("handleChecking:"))
        cell.imageView.addGestureRecognizer(checkboxTap)
        cell.imageView.userInteractionEnabled = true
        
        
        //cell.contentView.addSubview(UIView(frame: CGRect(x: 50, y: 100, width: 300, height: 20)))
        
        return cell
    }
    
    func handleChecking(tapRecognizer: UITapGestureRecognizer) {
        println("Tapped")
        
        var taplocation: CGPoint = tapRecognizer.locationInView(videoSelectionTableView)
        
        var tappedIndexPath: NSIndexPath = videoSelectionTableView.indexPathForRowAtPoint(taplocation)!
        
        if selectedRowsArray.containsObject(tappedIndexPath.row) {
            selectedRowsArray.removeObject(tappedIndexPath.row)
            
        } else {
            selectedRowsArray.addObject(tappedIndexPath.row)
        }
        
        videoSelectionTableView.reloadData()
        
    }
    

    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var cellText: String = "Go get some text for your cell."
        let mycellText: NSString = cellText as NSString
        var cellFont: UIFont = UIFont(name: "Arial", size: 12.0)!
        //var constraintSize: CGSize = CGSize(width: 280.0f, height: MAXFLOAT)
       
        var attributedText: NSAttributedString = NSAttributedString(string: mycellText, attributes:
            [NSForegroundColorAttributeName: UIColor.lightGrayColor(),
            NSFontAttributeName: cellFont])
        
        var rect: CGRect = attributedText.boundingRectWithSize(CGSizeMake(videoSelectionTableView.bounds.size.width, CGFloat.max), options: NSStringDrawingOptions.UsesLineFragmentOrigin, context: nil)
        
        return rect.size.height + 20
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}