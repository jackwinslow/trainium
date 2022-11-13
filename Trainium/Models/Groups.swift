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
    
    @Published var globalGroups: [Group] = []
    
    static let shared = Groups()
    
    var db: Firestore!
    
    init() {
        db = Firestore.firestore()
    }
    
    func createNewGroup(name: String, discoverable: Bool, members: [String]) {
        
        let newGroupRef = db.collection("groups").document()

        newGroupRef.setData([
            "name": name,
            "discoverable": discoverable,
            "leader": username,
            "members": [username],
            "documentID": newGroupRef.documentID
        ])
        
        for member in members {
            sendGroupInvite(groupID: newGroupRef.documentID, invitee: member)
        }
        
        // Add group to user
        db.collection("users").document(self.username).updateData([
            "groups": FieldValue.arrayUnion([newGroupRef.documentID])
        ])
        
    }
    
    func sendGroupInvite(groupID: String, invitee: String) {
        db.collection("users").document(invitee).updateData([
            "groupInvites": FieldValue.arrayUnion([groupID])
        ])
    }
    
    func acceptGroupInvite(groupID: String) {
        // Remove invite
        db.collection("users").document(self.username).updateData([
            "groupInvites": FieldValue.arrayRemove([groupID])
        ])
        
        // Add group to user
        db.collection("users").document(self.username).updateData([
            "groups": FieldValue.arrayUnion([groupID])
        ])
        
        // Add user to group
        db.collection("groups").document(groupID).updateData([
            "members": FieldValue.arrayUnion([self.username])
        ])
    }
    
    func declineGroupInvite(groupID: String) {
        // Remove invite
        db.collection("users").document(self.username).updateData([
            "groupInvites": FieldValue.arrayRemove([groupID])
        ])
    }
    
    func fetchGroups(groups: [String]) {
        currentUser.groupsArray = []
        for group in groups {
            db.collection("groups").document(group).getDocument { querySnapshot, error in
                guard error == nil else {
                    return
                }
                
                var newGroup = Group(
                    discoverable: querySnapshot!.get("discoverable") as! Bool,
                    members: querySnapshot!.get("members") as! [String],
                    name: querySnapshot!.get("name") as! String,
                    documentID: querySnapshot!.get("name") as! String)
                
                self.currentUser.groupsArray.append(newGroup)
            }
        }
    }
    
    func fetchGlobalGroups() {
        globalGroups = []
        db.collection("groups").limit(to: 20).addSnapshotListener { (querySnapshot, error) in
            guard error == nil else {
                print("ERROR: adding the snapshot listener \(String(describing: error?.localizedDescription))")
                return
            }
            self.globalGroups = [] // clean out existing studentArray since new data will load
            // there are querySnapshot!.documents.count documents in the snapshot
            for document in querySnapshot!.documents {
                let group = Group(dictionary: document.data())
                if self.currentUser.groups.contains(group.documentID) {
                    continue
                }
                self.globalGroups.append(group)
            }
        }
    }
    
}

class Group {
    var discoverable: Bool
    var members: [String]
    var name: String
    var documentID: String
    
    var dictionary: [String: Any] {
        return ["discoverable": discoverable, "members": members, "name": name]
    }
    
    init(discoverable: Bool, members: [String], name: String, documentID: String) {
        self.discoverable = discoverable
        self.members = members
        self.name = name
        self.documentID = documentID
    }
    
    convenience init(dictionary: [String: Any]) {
        let discoverable = dictionary["discoverable"] as! Bool? ?? false
        let members = dictionary["members"] as! [String]? ?? []
        let name = dictionary["name"] as! String? ?? ""
        
        self.init(discoverable: discoverable, members: members, name: name, documentID: "")
    }
}
