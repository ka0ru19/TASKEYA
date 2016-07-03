//
//  AppDelegate.swift
//  TASKEYA
//
//  Created by 井上航 on 2016/05/05.
//  Copyright © 2016年 Wataru Inoue. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    // ユーザー情報
    var app_TSK_ID: String? // "TSK_ID"
    
    // 位置情報
    var placeAdress: String?
    var placePoint: String? // 座標: 緯度,経度

    //    はじめての起動時に毎回呼び出される
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // NSDBから読み出し
        let defaults: UserDefaults = UserDefaults.standard()
        let id = defaults.object(forKey: "tsk_id") as? String
        
        if (id != nil) {
            app_TSK_ID = id
            print("id:\(id)")
            print("app_TSK_ID:\(app_TSK_ID)でログイン中")
        } else {
            // ログアウト中ならログイン画面へ
            let storyboard:UIStoryboard =  UIStoryboard(name: "Main",bundle:nil)
            var viewController: UIViewController!
            viewController = storyboard.instantiateViewController(withIdentifier: "loginViewController") as UIViewController
            window?.rootViewController = viewController
        }
        
        // Override point for customization after application launch.
        return true
    }

    //    アプリが非Activeになる直前に呼び出される
    func applicationWillResignActive(_ application: UIApplication) {
        
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    //    アプリが非Activeになりバックグランド実行になった際に呼び出される
    func applicationDidEnterBackground(_ application: UIApplication) {
        
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    //    2回目以降の起動時に呼び出される(Backgroundにアプリがある場合)
    func applicationWillEnterForeground(_ application: UIApplication) {
        
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    //    アプリがActiveになった際に呼び出される
    func applicationDidBecomeActive(_ application: UIApplication) {
        
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    //    システムからのアプリ終了の際に呼び出される
    func applicationWillTerminate(_ application: UIApplication) {
        
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    //    application:didFinishLaunchingWithOptions
    //    はじめての起動時に呼び出される
    //    application:applicationWillResignActive
    //    アプリが非Activeになる直前に呼び出される
    //    application:applicationDidEnterBackground
    //    アプリが非Activeになりバックグランド実行になった際に呼び出される
    //    application:applicationWillEnterForeground
    //    2回目以降の起動時に呼び出される(Backgroundにアプリがある場合)
    //    application:applicationDidBecomeActive
    //    アプリがActiveになった際に呼び出される
    //    application:applicationWillTerminate
    //    システムからのアプリ終了の際に呼び出される


}

