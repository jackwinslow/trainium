//
//  Home.swift
//  Trainium
//
//  Created by Aidan Daly on 11/12/22.
//

import SwiftUI

struct HomeView: View {
    let tips = ["Working out every day can improve your mental health dramatically.", "Working out 3 - 5 times a week can improve mental health.", "Exercising increases neuroplasticity!"]
    var body: some View {
        ZStack {
            
            Color(0xFCF7EE).ignoresSafeArea()
            VStack(spacing: 0) {
                HStack {
                    Text("Home")
                        .font(.system(size: 45))
                    Spacer()
                    Image("coin")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                    Text(" 1500")

                        .font(.system(size: 35))
                    
                }
                .fontWeight(.bold)
                .foregroundColor(Color(0x424B54))
                .padding(.horizontal, 10)
                .padding(.bottom, 25)
                
                VStack{
                    HStack(spacing: 20) {
                        ForEach(0..<7) {_ in
                            Image(systemName: "circle")
                                .resizable()
                                .scaledToFit()
                                .frame(height:20)
                            
                        }
                    }
                    Text("Great job you're on a 5 day streak!")
                        .foregroundColor(Color(0xFCF7EE))
                        .fontWeight(.medium)
                }
                .padding()
                .background(Color(0xFE5D6D))
                .cornerRadius(12)
                .padding(.bottom, 15)
                
                Button {
                    
                } label : {
                    Text("Schedule A Workout")
                        .lineLimit(nil)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 15)
                        .background(Color(0xFE3448))
                        .cornerRadius(12)
                }
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(Color(0xFCF7EE))
                .padding(.bottom, 25)
    
                
                
                
                Text("Partners")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(Color(0x424B54))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 10)
                    .padding(.bottom, 10)
                    

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(0..<10) {_ in
                            VStack {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height:75)
                                
                                Text("Friend Name")
                                    .font(.system(size: 15))
                            }
                            .frame(width: 100)
                        }
                    }
                    .padding(.leading, 15)
                }
                .padding(.bottom, 25)
                
                Text("Groups")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(Color(0x424B54))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 10)
                    .padding(.bottom, 10)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(0..<10) {_ in
                            VStack {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height:75)
                                
                                Text("Group Name")
                                    .font(.system(size: 15))
                            }
                            .frame(width: 100)
                        }
                    }
                    .padding(.leading, 15)
                }
                .padding(.bottom, 25)
                
                Text("Motivation!")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(Color(0x424B54))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 10)
                    .padding(.bottom, 10)
                
                Text(tips.randomElement()!)
                    .frame(width: 350, height: 100)
                    .lineLimit(nil)
                    .background(Color(0x424B54).opacity(0.70))
                    .cornerRadius(12)
                    .font(.system(size: 20))
                    .foregroundColor(Color(0xFCF7EE))
                    .fontWeight(.medium)
                
                
                    
                Spacer()
            }
            
            
            

        }

    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
