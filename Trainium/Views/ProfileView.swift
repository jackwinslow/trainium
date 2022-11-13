//
//  Profile.swift
//  Trainium
//
//  Created by Aidan Daly on 11/12/22.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        ZStack {
            VStack {
                
                Image(systemName: "gear")
                    .resizable()
                    .frame(width:40, height: 40)
                    .opacity(0.5)

                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width:100, height: 100)
                    .opacity(0.5)
                
                Text("<Your Name>")
                    .foregroundColor(Color(0x424B54))
                    .frame(maxWidth: .infinity, alignment: .center)
                Spacer()
                
                Text("Your stats")
                    .foregroundColor(Color(0x424B54))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 15)
                Spacer()
            }
            .font(.system(size: 20))
            .fontWeight(.bold)
            .padding(.top, 300)
            
            /*HStack {
                Text("🔥 x day streak")
                    .padding(10)
                    .foregroundColor(Color(0xFCF7EE))
                    .background(Color(0xFE2036).opacity(0.7)) // might take out opacity
                    .cornerRadius(12)
                    .padding(.leading, 20)
                Text("🏋️ x PRs this month")
                    .padding(10)
                    .foregroundColor(Color(0xFCF7EE))
                    .background(Color(0xFE2036).opacity(0.7)) // might take out opacity
                    .cornerRadius(12)
                    .padding(.leading, 20)
            } */
            .frame(maxWidth: .infinity, alignment: .leading)
            .fontWeight(.medium)
    

        }
            }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
