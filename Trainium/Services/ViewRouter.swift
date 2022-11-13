//
//  ViewRouter.swift
//  Trainium
//
//  Created by Jack Winslow on 11/13/22.
//

import SwiftUI

class ViewRouter: ObservableObject {
    
    static let shared = ViewRouter()
    
    @Published var currentPage: Page = .home
}

enum Page {
    case home, community, personal
}
