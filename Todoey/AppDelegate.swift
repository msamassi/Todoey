//
//  AppDelegate.swift
//  Todoey
//
//  Created by Mohamed Samassi on 09/02/2018.
//  Copyright © 2018 Mo Samassi. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Override point for customization after application launch.
//        print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String)
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        //just for testing Realm initialisation, so we can replace the realm var by _
        do {
            //let realm =  try Realm()
            _ =  try Realm()
        } catch {
            print("Error Intialising new Realm  : \(error)")
        }
        

        
        
        
        
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
    
    }
    
    // MARK: - Core Data stack
    



}

