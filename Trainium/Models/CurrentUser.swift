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
//    @AppStorage("groups") var groups: [String]: []
//    @AppStorage("groupInvites") var groupInvites: [String]: []
//    @AppStorage("workoutInvites") var workoutInvites: [String] = ""
//    @AppStorage("currentWorkout") var currentWorkout: String = ""
    
    @Published var friendsArray: [User] = []
    
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
        
        completed()
    }
}
