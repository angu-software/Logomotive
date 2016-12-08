//
//  AppDelegate.swift
//  Logomotive
//
//  Created by devdrey on 11/27/2016.
//  Copyright (c) 2016 devdrey. All rights reserved.
//

import UIKit
import Logomotive

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        #if UNITTESTS
            return true
        #endif
        
        Log.logger = [ConsoleLogger(logLevel: .debug),
                      NSLogLogger(logLevel: .debug),
                      FileLogger(logLevel: .debug)]
        Log.debug("This is a debug log")
        Log.info("This is an info log")
        Log.warning("This is a warning log")
        Log.error("This is an error log")

        return true
    }
}

