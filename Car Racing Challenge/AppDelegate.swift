//
//  AppDelegate.swift
//  Car Racing Challenge
//
//  Created by Alex Ongarato on 08/03/15.
//  Copyright (c) 2017 Dennis Du. All rights reserved.
//

import UIKit
import AVOSCloud
import UserNotifications
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window          : UIWindow?
    var gameController  : GameViewController!;
    
    class func getInstance() -> AppDelegate
    {
        return (UIApplication.shared.delegate as! AppDelegate);
    }
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
//        Utils.printFontNames()
        AVOSCloud.setApplicationId("ViqsjWHUrxuDjybMEeKXALuN-gzGzoHsz", clientKey: "JmWTBTGNygug59d1bQpEszG6")
        DataProvider.didFinishLaunchingWithOptions();
        AudioHelper.didFinishLaunchingWithOptions();
        if #available(iOS 10.0, *){
            let center  = UNUserNotificationCenter.current()
            center.delegate = self
            center.requestAuthorization(options: [.sound, .alert, .badge]) { (granted, error) in
                if error == nil{
                    DispatchQueue.main.async {
                         UIApplication.shared.registerForRemoteNotifications()
                    }
                   
                }
            }
        }else{
            UIApplication.shared.registerForRemoteNotifications()
        }
        return true;
    }

    func applicationWillResignActive(_ application: UIApplication)
    {
//        self.gameController.applicationWillResignActive();
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication)
    {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
//        GameCenterController.setReadyStatus(false);
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication)
    {
        print("AppDelegate -> did become active");
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
//        if(self.gameController != nil)
//        {
//            self.gameController.applicationDidBecomeActive();
//        }
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        AVOSCloud.handleRemoteNotifications(withDeviceToken: deviceToken)
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print(error)
    }
    
    


}

