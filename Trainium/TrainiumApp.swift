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
    @StateObject var authViewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if authViewModel.signedIn {
                    HomeView()
                } else {
                    OnBoardView(onBoardRouter: onBoardRouter, authViewModel: authViewModel)
                }
            }
            .onAppear {
                authViewModel.signedIn = authViewModel.isSignedIn
            }
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
