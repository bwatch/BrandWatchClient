//
//  ParseClient.swift
//  BrandWatchClient
//
//  Created by Nabib El-RAHMAN on 10/19/14.
//  Copyright (c) 2014 BrandWatch. All rights reserved.
//

import UIKit

class ParseClient: NSObject {
    
    class func saveCampaign(campaign: Campaign, callback: (succeeded: Bool, error: NSError!) -> Void) {
        var pfObject = campaign.getPFObject()
        pfObject.saveInBackgroundWithBlock(callback)
    }
    
    class func deleteCampaign(campaign: Campaign, callback: (succeeded: Bool, error: NSError!) -> Void) {
        var pfObject = campaign.getPFObject()
        pfObject.deleteInBackgroundWithBlock(callback)
    }
    
    
    class func getCampaignById(id: String, callback: ((pfCampaign: PFObject!, error: NSError!) -> Void)) {
        var query = PFQuery(className:"Campaign")
        query.getObjectInBackgroundWithId(id, callback)
    }
    
    class func getCampaignsByUserId(userId: String, callback: ((pfObjects: [PFObject]!, error: NSError!) -> Void)) {
        var query = PFQuery(className:"Campaign")
        query.whereKey("user_id", equalTo: userId)
        query.findObjectsInBackgroundWithBlock { (results: [AnyObject]!, error: NSError!) -> Void in
            if(error != nil) {
                var pfobjects = [PFObject]()
                for result in results {
                    var pfObject = result as PFObject
                    pfobjects.append(pfObject)
                }
                callback(pfObjects: pfobjects, error: nil)
            } else {
                callback(pfObjects: nil, error: error)
            }
            
        }
    }
}