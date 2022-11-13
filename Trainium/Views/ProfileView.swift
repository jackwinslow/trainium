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
                    .frame(maxWidth: .infinity, alignment:
                            .trailing)
                    .padding(.trailing, 30)
                    .padding(.top, 0)
                    

                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width:100, height: 100)
                    .opacity(0.5)
                
                Text("Joe Schmo")
                    .foregroundColor(Color(0x424B54))
                    .frame(maxWidth: .infinity, alignment:
                            .center)
                
                Text("You are on a 15 day streak🔥")
                    .foregroundColor(Color(0x424B54))
                    .frame(maxWidth: .infinity, alignment: .center)

                Spacer()
                    .frame(height: 35)
                
                Text("Your Recent Workouts")
                    .foregroundColor(Color(0x424B54))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 15)
                
                Spacer()
            }
            
            .font(.system(size: 20))
            .fontWeight(.bold)
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
