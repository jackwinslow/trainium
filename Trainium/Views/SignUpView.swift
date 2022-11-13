//
//  SignUpView.swift
//  Trainium
//
//  Created by Jack Winslow on 11/12/22.
//

import SwiftUI

struct SignUpView: View {
    
    @Binding var firstName: String
    @Binding var lastName: String
    @Binding var email: String
    @Binding var username: String
    @Binding var password: String
    
    var body: some View {
        VStack {
            Text("Create your account")
                .foregroundColor(Color(0x424B54))
                .font(.system(size: 22))
                .fontWeight(.bold)
                .padding(24)
            
            VStack(alignment: .leading) {
                Text("First Name")
                    .foregroundColor(Color(0x424B54))
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                
                TextField("", text: $firstName)
                    .frame(height: 35)
                    .disableAutocorrection(true)
                    .foregroundColor(Color(0xFE2036))
                    .accentColor(Color(0xFE2036))
                    .padding(.leading,12)
                    .overlay(
                         RoundedRectangle(cornerRadius: 12)
                             .stroke(Color(0x424B54), lineWidth: 1)
                    )
            }
            .padding(.bottom,24)
            
            VStack(alignment: .leading) {
                Text("Last Name")
                    .foregroundColor(Color(0x424B54))
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                
                TextField("", text: $lastName)
                    .frame(height: 35)
                    .disableAutocorrection(true)
                    .foregroundColor(Color(0xFE2036))
                    .accentColor(Color(0xFE2036))
                    .padding(.leading,12)
                    .overlay(
                         RoundedRectangle(cornerRadius: 12)
                             .stroke(Color(0x424B54), lineWidth: 1)
                    )
            }
            .padding(.bottom,24)
            
            VStack(alignment: .leading) {
                Text("Username")
                    .foregroundColor(Color(0x424B54))
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                
                TextField("", text: $username)
                    .frame(height: 35)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .foregroundColor(Color(0xFE2036))
                    .accentColor(Color(0xFE2036))
                    .padding(.leading,12)
                    .overlay(
                         RoundedRectangle(cornerRadius: 12)
                             .stroke(Color(0x424B54), lineWidth: 1)
                    )
            }
            .padding(.bottom,24)
            
            VStack(alignment: .leading) {
                Text("Email")
                    .foregroundColor(Color(0x424B54))
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                
                TextField("", text: $email)
                    .frame(height: 35)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .foregroundColor(Color(0xFE2036))
                    .accentColor(Color(0xFE2036))
                    .padding(.leading,12)
                    .overlay(
                         RoundedRectangle(cornerRadius: 12)
                             .stroke(Color(0x424B54), lineWidth: 1)
                    )
            }
            .padding(.bottom,24)
            
            VStack(alignment: .leading) {
                Text("Password")
                    .foregroundColor(Color(0x424B54))
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                
                SecureField("", text: $password)
                    .frame(height: 35)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .foregroundColor(Color(0xFE2036))
                    .accentColor(Color(0xFE2036))
                    .padding(.leading,12)
                    .overlay(
                         RoundedRectangle(cornerRadius: 12)
                             .stroke(Color(0x424B54), lineWidth: 1)
                    )
            }
                        
        }
        .padding(.horizontal, 32)
    }
}

//struct SignUpView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignUpView(firstName: <#Binding<String>#>, lastName: <#Binding<String>#>, email: <#Binding<String>#>, username: <#Binding<String>#>, password: <#Binding<String>#>)
//    }
//}
