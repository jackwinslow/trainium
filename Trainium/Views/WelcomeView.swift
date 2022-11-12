//
//  OnboardView.swift
//  Trainium
//
//  Created by Jack Winslow on 11/12/22.
//

import SwiftUI

struct WelcomeView: View {
    
    var body: some View {
        
        VStack {
            Spacer()
            
            HStack(spacing: 0) {
                Text("Welcome to ")
                    .foregroundColor(Color(0x424B54))
                
                Text("Trainium")
                    .foregroundColor(Color(0xFE2036))
            }
            .font(.system(size: 35))
            .fontWeight(.bold)
            .padding(.bottom, 18)
            
            Text("Mental fitness starts with fitness")
                .foregroundColor(Color(0x424B54).opacity(0.8))
                .font(.system(size: 20))
                .fontWeight(.medium)
                        
            Spacer()
            
            Button {
                print("")
            } label: {
                Text("Get Started")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .fontWeight(.medium)
                    .foregroundColor(Color(0xFCF7EE))
                    .background(Color(0xFE2036))
                    .cornerRadius(12)
            }
            .padding([.horizontal, .bottom], 32)

        }
    }
}

struct OnboardView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
