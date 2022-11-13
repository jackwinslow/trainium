//
//  AuthViewModel.swift
//  Trainium
//
//  Created by Jack Winslow on 11/12/22.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
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
            
            self.db.collection("users").document().setData([
                "authProvider": "local",
                "firstName": firstName,
                "lastName": lastName,
                "username": username,
                "email": email,
                "experienceLevel": experienceLevel,
                "discoverable": discoverable,
                "uid": result?.user.uid ?? ""
            ])
            
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
    }
}
