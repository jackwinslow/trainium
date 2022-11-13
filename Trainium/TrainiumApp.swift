//
//  TrainiumApp.swift
//  Trainium
//
//  Created by Jack Winslow on 11/12/22.
//

import SwiftUI

@main
struct TrainiumApp: App {
    
    @StateObject var onBoardRouter = OnBoardRouter.shared
    
    var body: some Scene {
        WindowGroup {
            //OnBoardView(onBoardRouter: onBoardRouter)
            HomeView()
        }
    }
}
