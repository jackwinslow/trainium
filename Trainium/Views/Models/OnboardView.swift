//
//  OnboardView.swift
//  Trainium
//
//  Created by Jack Winslow on 11/12/22.
//

import SwiftUI

struct OnboardView: View {
    var body: some View {
        ZStack {
            
            Color(0xFCF7EE).ignoresSafeArea()
            
            VStack {
                Text("Welcome to ")
                    .foregroundColor(Color(0x424B54))
                
                + Text("Trainium")
                    .foregroundColor(Color(0xFE2036))
            }
        }
    }
}

struct OnboardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardView()
    }
}
