//
//  AppDelegate.swift
//  Todoey
//
//  Created by Dakota Pratt on 2/11/19.
//  Copyright © 2019 Dakota Pratt. All rights reserved.
//

import UIKit
import RealmSwift


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //print(Realm.Configuration.defaultConfiguration.fileURL)

        
        do {
            _ = try Realm()
        } catch {
            print("Error initialising ne realm, \(error)")
        }
        
        
        return true
    }
    
}



