//
//  CurrentUser.swift
//  Trainium
//
//  Created by Jack Winslow on 11/13/22.
//

import SwiftUI
import Firebase

class CurrentUser: ObservableObject {
    static let shared = CurrentUser()
    
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String  = ""
    @AppStorage("username") var username: String = ""
    @AppStorage("email") var email: String = ""
    @AppStorage("experienceLevel") var experienceLevel: String = ""
    @AppStorage("discoverable") var discoverable: Bool = false
    @Published var friends: [String] = []
    @Published var friendRequests: [String] = []
    @Published var groups: [String] = []
    @Published var groupInvites: [String] = []
//    @Published var workoutInvites: [String] = ""
//    @Published var currentWorkout: String = ""
    
    @Published var friendsArray: [User] = []
    @Published var groupsArray: [Group] = []
    
    var db: Firestore!
    var listener: ListenerRegistration? = nil
    
    init() {
        db = Firestore.firestore()
    }
    
    func addListener(username: String, completed: @escaping () -> ()) {
        listener = db.collection("users").document(username).addSnapshotListener { (querySnapshot, error) in
            guard error == nil else {
                print("ERROR: adding the snapshot listener \(String(describing: error?.localizedDescription))")
                return completed()
            }
            
            self.firstName = querySnapshot?.get("firstName") as! String
            self.lastName = querySnapshot?.get("lastName") as! String
            self.username = querySnapshot?.get("username") as! String
            self.email = querySnapshot?.get("email") as! String
            self.experienceLevel = querySnapshot?.get("experienceLevel") as! String
            self.discoverable = querySnapshot?.get("discoverable") as! Bool
            self.friends = querySnapshot?.get("friends") as! [String]
            self.friendRequests = querySnapshot?.get("friendRequests") as! [String]
            self.groups = querySnapshot?.get("groups") as! [String]
            self.groupInvites = querySnapshot?.get("groupInvites") as! [String]
            
            completed()
        }
    }
    
    func removeListener(completed: @escaping () -> ()) {
        listener!.remove()
        
        firstName = ""
        lastName  = ""
        username = ""
        email = ""
        experienceLevel = ""
        discoverable = false
        friends = []
        friendRequests = []
        friendsArray = []
        groups = []
        groupInvites = []
        groupsArray = []
        
        completed()
    }
}
