//
//  AuthViewModel.swift
//  Trainium
//
//  Created by Jack Winslow on 11/12/22.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @StateObject var currentUser = CurrentUser.shared
    
    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    var db = Firestore.firestore()
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    @Published var returnString = ""
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else {
                self.returnString = error?.localizedDescription ?? ""
                print(error?.localizedDescription)
                return
            }
            
            var username = ""
            
            self.db.collection("users").whereField("email", isEqualTo: email).getDocuments { querySnapshot, queryError in
                for document in querySnapshot!.documents {
                    print(document.get("username") as! String)
                    username = document.get("username") as! String
                }
                
                self.currentUser.addListener(username: username) {
                    print("Added listener on current user")
                }
            }
            
            // Success
            self.signedIn = true
            
        }
    }
    
    func signUp(firstName: String, lastName: String, username: String, email: String, password: String, experienceLevel: String, beDiscoverable: String) {
        auth.createUser(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else {
                self.returnString = error?.localizedDescription ?? ""
                print(error?.localizedDescription)
                return
            }
            
            var discoverable = false
            
            if beDiscoverable == "Yes, make me discoverable" {
                discoverable = true
            }
            
            self.db.collection("users").document(username).setData([
                "authProvider": "local",
                "firstName": firstName,
                "lastName": lastName,
                "username": username,
                "email": email,
                "experienceLevel": experienceLevel,
                "discoverable": discoverable,
                "friends": [],
                "friendRequests": [],
                "groups": [],
                "groupInvites": [],
                "workoutInvites": [],
                "currentWorkout": ""
            ])
            
            self.currentUser.addListener(username: username) {
                print("Added listener on current user")
            }
            
            // Success
            self.signedIn = true
        }
    }
    
    func signOut() {
        do {
            try auth.signOut()
            self.signedIn = false
        } catch {
            print(error.localizedDescription)
        }
        
        currentUser.removeListener {
            print("Removed listener on current user")
        }
    }
}
