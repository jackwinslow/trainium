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
    case welcome, signin, signup, experience, discovery
    
    mutating func next(){
        if self == .welcome {
            self = Stage(rawValue: rawValue + 2) ?? Stage(rawValue: 0)!
        } else {
            self = Stage(rawValue: rawValue + 1) ?? Stage(rawValue: 0)!
        }
    }
    
    mutating func last(){
        if self == .signup {
            self = Stage(rawValue: rawValue - 2) ?? Stage(rawValue: 0)!
        } else {
            self = Stage(rawValue: rawValue - 1) ?? Stage(rawValue: 0)!
        }
    }
}
