//
//  OnBoardRouter.swift
//  Trainium
//
//  Created by Jack Winslow on 11/12/22.
//

import SwiftUI

class OnBoardRouter: ObservableObject {
    
    static let shared = OnBoardRouter()
    
    @Published var currentPage: Stage = .welcome
    
}

enum Stage: Int {
    case welcome, signup, experience, discovery
    
    mutating func next(){
        self = Stage(rawValue: rawValue + 1) ?? Stage(rawValue: 0)!
    }
}
