//
//  TrainiumApp.swift
//  Trainium
//
//  Created by Jack Winslow on 11/12/22.
//

import SwiftUI
import FirebaseCore

@main
struct TrainiumApp: App {
    
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var onBoardRouter = OnBoardRouter.shared
    
    var body: some Scene {
        WindowGroup {
            OnBoardView(onBoardRouter: onBoardRouter)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
