//
//  SignInView.swift
//  Trainium
//
//  Created by Jack Winslow on 11/12/22.
//

import SwiftUI

struct SignInView: View {
    
    @Binding var email: String
    @Binding var password: String

    var body: some View {
        VStack {
            Text("Login to your account")
                .foregroundColor(Color(0x424B54))
                .font(.system(size: 22))
                .fontWeight(.bold)
                .padding(24)
            
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

//struct SignInView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignInView(email: <#Binding<String>#>, password: <#Binding<String>#>)
//    }
//}
