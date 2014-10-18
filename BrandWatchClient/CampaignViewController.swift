//
//  CampaignViewController.swift
//  BrandWatchClient
//
//  Created by Niaz Jalal on 10/11/14.
//  Copyright (c) 2014 BrandWatch. All rights reserved.
//

import UIKit

class CampaignViewController: UIViewController {
    
    @IBOutlet weak var quartileLabel: UILabel!
    @IBOutlet weak var q25Label: UILabel!
    @IBOutlet weak var q50Label: UILabel!
    @IBOutlet weak var q75Label: UILabel!
    @IBOutlet weak var q100Label: UILabel!
    @IBOutlet weak var q25ValueLabel: UILabel!
    @IBOutlet weak var q50ValueLabel: UILabel!
    @IBOutlet weak var q75ValueLabel: UILabel!
    @IBOutlet weak var q100ValueLabel: UILabel!

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var vtrLabel: UILabel!
    @IBOutlet weak var ctrLabel: UILabel!
    @IBOutlet weak var sharesLabel: UILabel!
    @IBOutlet weak var favoritesLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    
    @IBOutlet weak var scoreValueLabel: UILabel!
    @IBOutlet weak var vtrValueLabel: UILabel!
    @IBOutlet weak var ctrValueLabel: UILabel!
    @IBOutlet weak var sharesCountLabel: UILabel!
    @IBOutlet weak var favoritesCountLabel: UILabel!
    @IBOutlet weak var likesCountLabel: UILabel!
    @IBOutlet weak var commentsCountLabel: UILabel!
    
    @IBOutlet weak var campaignTitleButton: UIButton!
    
    var campaignTitleA: String!
    var campaignTitleB: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get campaign view nib
        var nib = UINib(nibName: "CampaignView", bundle: nil)
        
        var objects = nib.instantiateWithOwner(self, options: nil)
        
        var campaignView = objects[0] as UIView
        view.addSubview(campaignView)
        
        // Setup line breaks according to autolayout values from campaign view
        var titleLineView = CampaignLineView(frame: CGRect(x: 10, y: 64, width: 300, height: 4))
        titleLineView.backgroundColor = UIColor.clearColor()
        view.addSubview(titleLineView)
        
        var quartileLineView = SectionLineView(frame: CGRect(x: 10, y: 156, width: 300, height: 2))
        quartileLineView.backgroundColor = UIColor.clearColor()
        view.addSubview(quartileLineView)
        
        var engagementLineView = SectionLineView(frame: CGRect(x: 10, y: 198, width: 300, height: 2))
        engagementLineView.backgroundColor = UIColor.clearColor()
        view.addSubview(engagementLineView)
        
        var vtrLineView = SectionLineView(frame: CGRect(x: 10, y: 240, width: 300, height: 2))
        vtrLineView.backgroundColor = UIColor.clearColor()
        view.addSubview(vtrLineView)
        
        var ctrLineView = SectionLineView(frame: CGRect(x: 10, y: 282, width: 300, height: 2))
        ctrLineView.backgroundColor = UIColor.clearColor()
        view.addSubview(ctrLineView)
        
        var sharesLineView = SectionLineView(frame: CGRect(x: 10, y: 324, width: 300, height: 2))
        sharesLineView.backgroundColor = UIColor.clearColor()
        view.addSubview(sharesLineView)

        var favoritesLineView = SectionLineView(frame: CGRect(x: 10, y: 366, width: 300, height: 2))
        favoritesLineView.backgroundColor = UIColor.clearColor()
        view.addSubview(favoritesLineView)

        var likesLineView = SectionLineView(frame: CGRect(x: 10, y: 408, width: 300, height: 2))
        likesLineView.backgroundColor = UIColor.clearColor()
        view.addSubview(likesLineView)

        // draw borders for quartile table
        quartileLabel.textColor = UIColor.whiteColor()
        
        q25Label.layer.borderColor = UIColor.whiteColor().CGColor
        q25Label.layer.borderWidth = 1
        q25Label.textColor = UIColor.whiteColor()
        
        q50Label.layer.borderColor = UIColor.whiteColor().CGColor
        q50Label.layer.borderWidth = 1
        q50Label.textColor = UIColor.whiteColor()
        
        q75Label.layer.borderColor = UIColor.whiteColor().CGColor
        q75Label.layer.borderWidth = 1
        q75Label.textColor = UIColor.whiteColor()
        
        q100Label.layer.borderColor = UIColor.whiteColor().CGColor
        q100Label.layer.borderWidth = 1
        q100Label.textColor = UIColor.whiteColor()

        q25ValueLabel.layer.borderColor = UIColor.whiteColor().CGColor
        q25ValueLabel.layer.borderWidth = 1
        q25ValueLabel.textColor = UIColor.whiteColor()

        q50ValueLabel.layer.borderColor = UIColor.whiteColor().CGColor
        q50ValueLabel.layer.borderWidth = 1
        q50ValueLabel.textColor = UIColor.whiteColor()

        q75ValueLabel.layer.borderColor = UIColor.whiteColor().CGColor
        q75ValueLabel.layer.borderWidth = 1
        q75ValueLabel.textColor = UIColor.whiteColor()

        q100ValueLabel.layer.borderColor = UIColor.whiteColor().CGColor
        q100ValueLabel.layer.borderWidth = 1
        q100ValueLabel.textColor = UIColor.whiteColor()
        
        // setup view and button colors
        campaignView.backgroundColor = UIColor.clearColor()
        campaignView.backgroundColor = UIColor.orangeColor()
        
        // NAJ: buttons were removed and replaced with new menu
//        campaignAButton.layer.backgroundColor = UIColor.clearColor().CGColor
//        campaignAButton.layer.borderColor = UIColor.orangeColor().CGColor
//        campaignAButton.layer.cornerRadius = 8
//        campaignAButton.layer.borderWidth = 2
//        campaignAButton.layer.backgroundColor = UIColor.whiteColor().CGColor
//        campaignAButton.setTitleColor(UIColor.orangeColor(), forState: .Normal)
//        campaignAButton.clipsToBounds = true
//        campaignBButton.layer.backgroundColor = UIColor.clearColor().CGColor
//        campaignBButton.layer.borderColor = UIColor.orangeColor().CGColor
//        campaignBButton.layer.cornerRadius = 8
//        campaignBButton.layer.borderWidth = 2
//        campaignBButton.layer.backgroundColor = UIColor.whiteColor().CGColor
//        campaignBButton.setTitleColor(UIColor.orangeColor(), forState: .Normal)
//        campaignBButton.clipsToBounds = true
//        signOutButton.layer.backgroundColor = UIColor.clearColor().CGColor
//        signOutButton.layer.borderColor = UIColor.orangeColor().CGColor
//        signOutButton.layer.cornerRadius = 8
//        signOutButton.layer.borderWidth = 2
//        signOutButton.layer.backgroundColor = UIColor.whiteColor().CGColor
//        signOutButton.setTitle("Sign Out", forState: UIControlState.Normal)
//        signOutButton.setTitleColor(UIColor.orangeColor(), forState: .Normal)
//        signOutButton.clipsToBounds = true
        
        campaignTitleButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        
        scoreLabel.textColor = UIColor.whiteColor()
        vtrLabel.textColor = UIColor.whiteColor()
        ctrLabel.textColor = UIColor.whiteColor()
        sharesLabel.textColor = UIColor.whiteColor()
        favoritesLabel.textColor = UIColor.whiteColor()
        likesLabel.textColor = UIColor.whiteColor()
        commentsLabel.textColor = UIColor.whiteColor()
        
        scoreValueLabel.textColor = UIColor.whiteColor()
        vtrValueLabel.textColor = UIColor.whiteColor()
        ctrValueLabel.textColor = UIColor.whiteColor()
        sharesCountLabel.textColor = UIColor.whiteColor()
        favoritesCountLabel.textColor = UIColor.whiteColor()
        likesCountLabel.textColor = UIColor.whiteColor()
        commentsCountLabel.textColor = UIColor.whiteColor()
        
        loadTestCampaignA()
        setCampaignTitles()
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadTestCampaignA() {
            
        loadCampaign("3agqQCqwsX")
    }
    
    func loadTestCampaignB() {
    
        loadCampaign("jsSsc3kxrn")
    }
    
    func setCampaignTitles() {
        
        setCampaignATitle()
        setCampaignBTitle()
    }
    
    private func loadCampaign(id: String) {
        
        var query = PFQuery(className:"Campaign")
        
        query.getObjectInBackgroundWithId(id) {
            (pfCampaign: PFObject!, error: NSError!) -> Void in
            if error == nil {
                
                NSLog("%@", pfCampaign)
                
                // Set values
                let name = pfCampaign["name"] as String
                self.campaignTitleButton.setTitle("\(name)", forState: UIControlState.Normal)
                
                let quartile25Count = pfCampaign["quartile25Count"] as Int
                self.q25ValueLabel.text = "\(quartile25Count)"
                
                let quartile50Count = pfCampaign["quartile50Count"] as Int
                self.q50ValueLabel.text = "\(quartile50Count)"
                
                let quartile75Count = pfCampaign["quartile75Count"] as Int
                self.q75ValueLabel.text = "\(quartile75Count)"
                
                let quartile100Count = pfCampaign["quartile100Count"] as Int
                self.q100ValueLabel.text = "\(quartile100Count)"
                
                let score = pfCampaign["score"] as Int
                self.scoreValueLabel.text = "\(score)"
                
                let vtrF = pfCampaign["vtr"] as Float
                let vtr = vtrF.format(".1")
                self.vtrValueLabel.text = "\(vtr)%"
                
                let ctrF = pfCampaign["ctr"] as Float
                let ctr = ctrF.format(".1")
                self.ctrValueLabel.text = "\(ctr)%"
                
                let shares = pfCampaign["score"] as Int
                self.sharesCountLabel.text = "\(shares)"
                
                // NAJ: Update tweets to favorites in PARSE
                let favorites = pfCampaign["tweets"] as Int
                self.favoritesCountLabel.text = "\(favorites)"
                
                let likes = pfCampaign["likes"] as Int
                self.likesCountLabel.text = "\(likes)"
                
                let comments = pfCampaign["comments"] as Int
                self.commentsCountLabel.text = "\(comments)"
            } else {
                
                NSLog("%@", error)
            }
        }
        
    }
    
    private func setCampaignATitle() {
        
        var query = PFQuery(className:"Campaign")
        
        
        query.getObjectInBackgroundWithId("3agqQCqwsX") {
            (pfCampaign: PFObject!, error: NSError!) -> Void in
            if error == nil {
                
                NSLog("%@", pfCampaign)
                
                // Set button name
                let name = pfCampaign["name"] as String
                self.campaignTitleA = name
            } else {
                
                NSLog("%@", error)
            }
        }
    }
    
    private func setCampaignBTitle() {
        
        var query = PFQuery(className: "Campaign")
        
        query.getObjectInBackgroundWithId("jsSsc3kxrn") {
            (pfCampaign: PFObject!, error: NSError!) -> Void in
            if error == nil {
                
                NSLog("%@", pfCampaign)
                
                // Set button name
                let name = pfCampaign["name"] as String
                self.campaignTitleB = name
            } else {
                
                NSLog("%@", error)
            }
        }
    }
    
    func signOut() {
        
        println("Signing out...")
        
        // kKeyChainItemName will move to the User Model
        var kKeyChainItemName = "BrandWatch Client: YouTube"
        GTMOAuth2ViewControllerTouch.removeAuthFromKeychainForName(kKeyChainItemName)
        
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            
            println("going to the login screen")
        })
    }
    
    @IBAction func onCampaignMenuDropdownTapped(sender: UIButton) {
        
        var styleItems = NSArray(objects:
            RWDropdownMenuItem(text:"Create Campaign", image:nil, action:{
                println("loading settings view (create)")
                self.loadSettingsView()
            }),
            RWDropdownMenuItem(text:"Edit Campaign", image:nil, action:{
                println("loading settings view (edit)")
                self.loadSettingsView()
            }),
            RWDropdownMenuItem(text:campaignTitleA, image:nil, action:{
                println("loading campaign \(self.campaignTitleA)")
                self.loadTestCampaignA()
                self.campaignTitleButton.setTitle(self.campaignTitleA, forState: UIControlState.Normal)
            }),
            RWDropdownMenuItem(text:campaignTitleB, image:nil, action:{
                println("loading campaign \(self.campaignTitleB)")
                self.loadTestCampaignB()
                self.campaignTitleButton.setTitle(self.campaignTitleB, forState: UIControlState.Normal)
            }),
            RWDropdownMenuItem(text:"Sign Out", image:nil, action:{
                self.signOut()
            })
        )
        
        RWDropdownMenu.presentFromViewController(self, withItems: styleItems, align: RWDropdownMenuCellAlignment.Center, style: RWDropdownMenuStyle.Translucent, navBarImage: nil, completion: nil)
    }
    
    func loadSettingsView() {
        
        let settingsVC = SettingsViewController() as SettingsViewController
        
        println("loadSettingsView() pressed")
        
        self.presentViewController(settingsVC, animated: true) { () -> Void in
            
            println("transitioning to settings controller")
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
