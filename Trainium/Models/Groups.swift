//
//  Groups.swift
//  Trainium
//
//  Created by Jack Winslow on 11/13/22.
//

import SwiftUI
import Firebase

class Groups: ObservableObject {
    @StateObject var currentUser = CurrentUser.shared
    
    @AppStorage("username") var username: String = ""
    
    static let shared = Groups()
    
    var db: Firestore!
    
    init() {
        db = Firestore.firestore()
    }
    
    func createNewGroup(name: String, discoverable: Bool, members: [String]) {
        
        
        
    }
}

class Group {
    var discoverable: Bool
    var members: [String]
    var name: String
    
    var dictionary: [String: Any] {
        return ["discoverable": discoverable, "members": members, "name": name]
    }
    
    init(discoverable: Bool, members: [String], name: String) {
        self.discoverable = discoverable
        self.members = members
        self.name = name
    }
    
    convenience init(dictionary: [String: Any]) {
        let discoverable = dictionary["discoverable"] as! Bool? ?? false
        let members = dictionary["members"] as! [String]? ?? []
        let name = dictionary["name"] as! String? ?? ""
        
        self.init(discoverable: discoverable, members: members, name: name)
    }
}
