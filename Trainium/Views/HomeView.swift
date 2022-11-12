//
//  Home.swift
//  Trainium
//
//  Created by Aidan Daly on 11/12/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            
            Color(0xFCF7EE).ignoresSafeArea()
            
            HStack {
                Text("Home")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 15)
                    .font(.system(size: 35))
                Image("coin")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 30)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                Text(" x")
                    .padding(10)
                    .font(.system(size: 25))
                Spacer()
            }
            .fontWeight(.bold)
            .foregroundColor(Color(0x424B54))
            .padding(.bottom, 700)
            

        }

    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
