//
//  Users.swift
//  Trainium
//
//  Created by Jack Winslow on 11/13/22.
//

import SwiftUI
import Firebase

class Users: ObservableObject {
    @StateObject var currentUser = CurrentUser.shared
    
    @AppStorage("username") var username: String = ""
    
    static let shared = Users()
    
    @Published var friendsArray: [User] = []
    
    @Published var queryResultUsers: [User] = []
    
    var db: Firestore!
    
    init() {
        db = Firestore.firestore()
    }
    
    func sendFriendRequest(requestUser: String) {
        db.collection("users").document(requestUser).updateData([
            "friendRequests": FieldValue.arrayUnion([self.username])
        ])
    }
    
    func acceptFriendRequest(requestUser: String) {
        // Remove request
        db.collection("users").document(self.username).updateData([
            "friendRequests": FieldValue.arrayRemove([requestUser])
        ])
        
        // Add friend for current user
        db.collection("users").document(self.username).updateData([
            "friends": FieldValue.arrayUnion([requestUser])
        ])
        
        // Add friend for requesting user
        db.collection("users").document(requestUser).updateData([
            "friends": FieldValue.arrayUnion([self.username])
        ])
    }
    
    func declineFriendRequest(requestUser: String) {
        // Remove request
        db.collection("users").document(self.username).updateData([
            "friendRequests": FieldValue.arrayRemove([requestUser])
        ])
    }
    
    func fetchFriends(friends: [String]) {
        currentUser.friendsArray = []
        for friend in friends {
            db.collection("users").document(friend).getDocument { querySnapshot, error in
                guard error == nil else {
                    return
                }
                
                var newUser = User(
                    discoverable: querySnapshot!.get("discoverable") as! Bool,
                    experienceLevel: querySnapshot!.get("experienceLevel") as! String,
                    firstName: querySnapshot!.get("firstName") as! String,
                    lastName: querySnapshot!.get("lastName") as! String,
                    username: querySnapshot!.get("username") as! String)
                
                self.currentUser.friendsArray.append(newUser)
            }
        }
    }
    
    func fetchUsers(with keyword: String) {
        db.collection("users").whereField("username", isGreaterThanOrEqualTo: keyword).whereField("username", isLessThanOrEqualTo: keyword + "\u{f8ff}").getDocuments { querySnapshot, error in
            guard let documents = querySnapshot?.documents, error == nil else {
                print("No documents")
                return
            }
            self.queryResultUsers = []
            for document in querySnapshot!.documents {
                
                var newUser = User(
                    discoverable: document.get("discoverable") as! Bool,
                    experienceLevel: document.get("experienceLevel") as! String,
                    firstName: document.get("firstName") as! String,
                    lastName: document.get("lastName") as! String,
                    username: document.get("username") as! String)
                
                if newUser.username == self.username {
                    continue
                }
                
                self.queryResultUsers.append(newUser)
            }
            
            print(self.queryResultUsers.count)
        }
    }
    
//    func friendsListener(completed: @escaping () -> ()) {
//        db.collection("users").document(username).whereField("region", isEqualTo: region).order(by: "release_title").addSnapshotListener { (querySnapshot, error) in
//            guard error == nil else {
//                print("ERROR: adding the snapshot listener \(String(describing: error?.localizedDescription))")
//                return completed()
//            }
//            Releases.shared.releasesArray = [] // clean out existing studentArray since new data will load
//            // there are querySnapshot!.documents.count documents in the snapshot
//            for document in querySnapshot!.documents {
//                let release = Release(dictionary: document.data())
//                release.documentID = document.documentID
//                Releases.shared.releasesArray.append(release)
//            }
//            completed()
//        }
//    }
    
}

class User {
    var discoverable: Bool
    var experienceLevel: String
    var firstName: String
    var lastName: String
    var username: String
    
    var dictionary: [String: Any] {
        return ["discoverable": discoverable, "experienceLevel": experienceLevel, "firstName": firstName, "lastName": lastName, "username": username]
    }
    
    init(discoverable: Bool, experienceLevel: String, firstName: String, lastName: String, username: String) {
        self.discoverable = discoverable
        self.experienceLevel = experienceLevel
        self.firstName = firstName
        self.lastName = lastName
        self.username = username
    }
    
    convenience init(dictionary: [String: Any]) {
        let discoverable = dictionary["discoverable"] as! Bool? ?? false
        let experienceLevel = dictionary["experienceLevel"] as! String? ?? ""
        let firstName = dictionary["firstName"] as! String? ?? ""
        let lastName = dictionary["lastName"] as! String? ?? ""
        let username = dictionary["username"] as! String? ?? ""
        
        self.init(discoverable: discoverable, experienceLevel: experienceLevel, firstName: firstName, lastName: lastName, username: username)
    }
}
