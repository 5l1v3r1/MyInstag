//
//  AppDelegate.swift
//  MyInstag
//
//  Created by Mehmet Baykar on 14/09/2019.
//  Copyright © 2019 Mehmet Baykar. All rights reserved.
//

import UIKit
import Parse


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        //configurition of the app using Parse code in Heroku
        Parse.enableLocalDatastore()
        PFAnalytics.trackAppOpened(launchOptions: launchOptions)
        let parseConfiguration = ParseClientConfiguration { (parse) in
            
            //Accessing Heroku App via id & keys
            parse.applicationId = APPLICATION_ID
            parse.clientKey = CLIENT_KEY
            parse.server =  SERVER_URL
            
        }
        
        //parse init.................
        Parse.initialize(with: parseConfiguration)
        
        
        
        if let window = UIApplication.shared.windows.first as UIWindow? {
            window.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
        
        logIn()
        
        
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func logIn()  {
        
        //check if the user is already created
        
        let userName = UserDefaults.standard.string(forKey: USER_NAME_DEFAULTS) ?? nil
        
        if userName != nil {
            
            let storyBoard = UIStoryboard(name: "MainScreen", bundle: nil)
            let tapBar = storyBoard.instantiateViewController(withIdentifier: "tabBar") as! UITabBarController
            window?.rootViewController = tapBar
            
        }
    }

}

