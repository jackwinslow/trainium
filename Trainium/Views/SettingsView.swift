//
//  Settings.swift
//  Trainium
//
//  Created by Aidan Daly on 11/13/22.
//

import SwiftUI

struct SettingsView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var username = ""
    @State private var password = ""
    @State var goBack = false
    
    var body: some View {
            if goBack {
//                ProfileView(authViewModel: )
            }
            else {
                setView
            }
            
        }
    
    var setView: some View {
        ZStack {
            
            Color("white").ignoresSafeArea()
            VStack(spacing: 0) {
                HStack {
                    
                    Button {
                        self.goBack = true
                    } label : {
                        Image(systemName: "arrow.left")
                            .foregroundColor(Color("black").opacity(0.7))
                            .font(.system(size: 25))

                            .padding(.leading, 10)
                            .padding(.trailing, 20)
                            
                    }
                    
                    Text("Schedule Workout")
                        .font(.system(size: 35))
                        .foregroundColor(Color("black"))
                        .fontWeight(.bold)
                    
                    
                }
                
                Text("Change Username:")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .foregroundColor(Color("black"))
                    .fontWeight(.medium)
                    .font(.system(size: 25))
                
                TextField("", text: $username)
                    .frame(width: 350, height: 35)
                    .disableAutocorrection(true)
                    .foregroundColor(Color(0xFE2036))
                    .accentColor(Color(0xFE2036))
                    .padding(.leading,12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color(0x424B54), lineWidth: 1)
                    )
                
                Text("Change First Name:")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .foregroundColor(Color("black"))
                    .fontWeight(.medium)
                    .font(.system(size: 25))
                
                TextField("", text: $firstName)
                    .frame(width: 350, height: 35)
                    .disableAutocorrection(true)
                    .foregroundColor(Color(0xFE2036))
                    .accentColor(Color(0xFE2036))
                    .padding(.leading,12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color(0x424B54), lineWidth: 1)
                    )
                
                
                Text("Change Last Name:")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .foregroundColor(Color("black"))
                    .fontWeight(.medium)
                    .font(.system(size: 25))
                
                TextField("", text: $lastName)
                    .frame(width: 350, height: 35)
                    .disableAutocorrection(true)
                    .foregroundColor(Color(0xFE2036))
                    .accentColor(Color(0xFE2036))
                    .padding(.leading,12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color(0x424B54), lineWidth: 1)
                    )
                
                
                Text("Password")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .foregroundColor(Color("black"))
                    .fontWeight(.medium)
                    .font(.system(size: 25))
                
                SecureField("", text: $password)
                    .frame(width: 350, height: 35)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .foregroundColor(Color(0xFE2036))
                    .accentColor(Color(0xFE2036))
                    .padding(.leading,12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color(0x424B54), lineWidth: 1)
                    )
                    .padding(.bottom, 40)
                
                
                Button {
                } label : {
                    Text("Log Out")
                        .foregroundColor(Color("red"))
                        .font(.system(size: 25))
                }
                
                
                
                
                
                
            }
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
