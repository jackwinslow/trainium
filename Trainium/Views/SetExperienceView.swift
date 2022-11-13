//
//  ExperienceView.swift
//  Trainium
//
//  Created by Jack Winslow on 11/12/22.
//

import SwiftUI

struct SetExperienceView: View {
    
    @State private var selection: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .center) {
                Text("How would you classify your fitness level?")
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(0x424B54))
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                .padding(24)
            }
            .frame(maxWidth: .infinity)
            
            ChoiceView(level: "Beginner", selection: $selection)
            ChoiceView(level: "Intermediate", selection: $selection)
            ChoiceView(level: "Advanced", selection: $selection)
            ChoiceView(level: "Gym Rat", selection: $selection)
        }
        .padding(.horizontal, 16)
    }
}

struct ExperienceView_Previews: PreviewProvider {
    static var previews: some View {
        SetExperienceView()
    }
}

struct ChoiceView: View {
    
    var level: String
    @Binding var selection: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Button {
                selection = level
            } label: {
                HStack(alignment: .center, spacing: 16) {
                    Image(systemName: selection == level ? "checkmark.circle.fill" : "circle")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 26)
                        .foregroundColor(selection == level ? Color(0xFE2036) : Color(0x424B54))
                    
                    Text(level)
                        .foregroundColor(selection == level ? Color(0xFE2036) : Color(0x424B54))
                        .font(.system(size: 26))
                }
            }
        }
    }
}
