//
//  SignUpView.swift
//  Trainium
//
//  Created by Jack Winslow on 11/12/22.
//

import SwiftUI

struct SignUpView: View {
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var username: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    
    var body: some View {
        VStack {
            Text("Create your account")
                .foregroundColor(Color(0x424B54))
                .font(.system(size: 20))
                .fontWeight(.medium)
            
            VStack(alignment: .leading) {
                Text("First Name")
                TextField("", text: $firstName)
                    .frame(height: 35)
                    .padding(.leading,12)
                    .overlay(
                         RoundedRectangle(cornerRadius: 12)
                             .stroke(.black.opacity(0.16), lineWidth: 1)
                    )
            }
            
            VStack(alignment: .leading) {
                Text("First Name")
                TextField("", text: $firstName)
                    .frame(height: 35)
                    .padding(.leading,12)
                    .overlay(
                         RoundedRectangle(cornerRadius: 12)
                             .stroke(.black.opacity(0.16), lineWidth: 1)
                    )
            }
            
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
