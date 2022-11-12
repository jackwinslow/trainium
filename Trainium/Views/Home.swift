//
//  Home.swift
//  Trainium
//
//  Created by Aidan Daly on 11/12/22.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ZStack {
            
            Color(0xFCF7EE).ignoresSafeArea()
            
            VStack {
                Text("Home")
                    .foregroundColor(Color(0x424B54))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 15)
                Spacer()
            }
            .font(.system(size: 35))
            .fontWeight(.bold)
            .padding(.top, 10)
            
            VStack {
                Text("Your stats")
                    .foregroundColor(Color(0x424B54))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 15)
                Spacer()
            }
            .font(.system(size: 20))
            .fontWeight(.bold)
            .padding(.top, 55)
            
            VStack {
                Text("x day streak")
                    .foregroundColor(Color(0x424B54))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 50)
                    .padding(.top, 100)
                Spacer()
            }
            
        }

    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
