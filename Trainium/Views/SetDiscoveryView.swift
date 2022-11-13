//
//  DiscoveryView.swift
//  Trainium
//
//  Created by Jack Winslow on 11/12/22.
//

import SwiftUI

struct SetDiscoveryView: View {
    
    @State private var selection: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .center) {
                Text("Would you like to be discoverable to others at your gym?")
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(0x424B54))
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .padding(.top, 24)
                    .padding(.bottom,5)
                
                Button {
                    
                } label: {
                    Text("Click here for more info")
                        .foregroundColor(Color(0x424B54).opacity(0.8))
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.bottom, 24)

            
            ChoiceView(level: "Yes, make me discoverable", selection: $selection)
            ChoiceView(level: "No, hide my profile", selection: $selection)
            
        }
        .padding(.horizontal, 16)
    }
}

struct DiscoveryView_Previews: PreviewProvider {
    static var previews: some View {
        SetDiscoveryView()
    }
}
