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
    @StateObject var viewRouter = ViewRouter.shared
    @StateObject var authViewModel = AuthViewModel()
    @StateObject var currentUser = CurrentUser.shared
    @StateObject var users = Users.shared
    @StateObject var groups = Groups.shared
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if authViewModel.signedIn {
                    ContentView(viewRouter: viewRouter, authViewModel: authViewModel, currentUser: currentUser, users: users, groups: groups)
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
