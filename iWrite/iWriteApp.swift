//
//  iWriteApp.swift
//  iWrite
//
//  Created by Nethan on 23/5/22.
//

import SwiftUI
import Firebase
import GoogleMobileAds



@main
struct iWriteApp: App {
    
    init() {
        FirebaseApp.configure()
        GADMobileAds.sharedInstance().start(completionHandler: nil)
    }
    var body: some Scene {
        WindowGroup {
            HomeView()
               
        }
    }
}



