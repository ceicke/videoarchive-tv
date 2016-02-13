//
//  AppDelegate.swift
//  videoarchive-tv
//
//  Created by Christoph Eicke on 08.02.16.
//  Copyright © 2016 Christoph Eicke. All rights reserved.
//

import UIKit
import TVMLKit
import Foundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, TVApplicationControllerDelegate {

    var window: UIWindow?

    var appController: TVApplicationController?
    static let TVBaseURL = "https://videoarchive.geisterstunde.org/"
    static let TVBootURL = "\(AppDelegate.TVBaseURL)movies.js"
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let appControllerContext = TVApplicationControllerContext()
        
        guard let javaScriptURL = NSURL(string: AppDelegate.TVBootURL) else {
            fatalError("unable to create NSURL")
        }
        
        appControllerContext.javaScriptApplicationURL = javaScriptURL
        appControllerContext.launchOptions["BASEURL"] = AppDelegate.TVBaseURL
        
        appController = TVApplicationController(context: appControllerContext, window: window, delegate: self)
        
        return true
    }

}

