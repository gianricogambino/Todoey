//
//  AppDelegate.swift
//  Todoey
//
//  Created by gianrico on 18/12/17.
//  Copyright © 2017 gianrico. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //print(Realm.Configuration.defaultConfiguration.fileURL)
       
        do {
            _ = try Realm()
        } catch {
            print("Error initializing realm \(error)")
        }
        return true
    }
}

