//
//  VisionBoardGeneratorApp.swift
//  VisionBoardGenerator
//
//  Created by Maria Kim on 4/8/24.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Firebase
        FirebaseApp.configure()
        
        // Adjust Navigation Bar title margin
        UINavigationBar.appearance().layoutMargins.left = 0
        
        return true
    }
}

@main
struct VisionBoardGeneratorApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .background(.vbgWenge)
                .ignoresSafeArea()
        }
    }
}
