//
//  Profile.swift
//  Trainium
//
//  Created by Aidan Daly on 11/12/22.
//

import SwiftUI

struct ProfileView: View {
    @State var goSettings = false
    
    var body: some View {
            if goSettings {
                SettingsView()
            }
            else {
                profile
            }
            
        }
    
    var profile: some View {
        ZStack {
            VStack {
            
                Button {
                    self.goSettings = true
                } label : {
                    Image(systemName: "gear")
                        .resizable()
                        .frame(width:40, height: 40)
                        .opacity(0.5)
                        .frame(maxWidth: .infinity, alignment:
                                .trailing)
                        .padding(.trailing, 30)
                        .padding(.top, 40)
                }
                    

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
                    .frame(height: 50)
                
                Text("Your Recent Workouts")
                    .foregroundColor(Color(0x424B54))
                    .frame(maxWidth: .infinity, alignment: .center)
                
                ZStack {
                    Rectangle()
                        .fill(Color("red").opacity(0.8))
                        .frame(width: 270, height: 250)
                        .cornerRadius(30)
                        .padding(.bottom, 275)
                    
                        VStack(spacing: 5) {
                            ForEach(0..<3) {_ in
                                HStack {
                                    Image(systemName: "figure.strengthtraining.traditional")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .frame(height:75)
                                        .foregroundColor(Color(0xffffff))
                                    
                                    Text("Date")
                                        .font(.system(size: 15))
                                        .padding(.leading, 15)
                                        .foregroundColor(Color(0xffffff))
                                    
                                    
                                    Text("Group Name")
                                        .font(.system(size: 15))
                                        .padding(.leading, 15)
                                        .foregroundColor(Color(0xffffff))
                                }
                                
                            }
                            .frame(maxWidth: .infinity, alignment: .center)
                        }
                        .padding(.bottom, 270)
                }
                
                Spacer()
            }
            
            .font(.system(size: 20))
            .fontWeight(.bold)
            .fontWeight(.medium)
    

        }
            }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
