//
//  Home.swift
//  Trainium
//
//  Created by Aidan Daly on 11/12/22.
//

import SwiftUI



struct HomeView: View {
    @State var showingSchedule = false
    let tips = ["Working out every day can improves mental health.", "Working out 3 - 5 times a week can improve mental health.", "Exercising increases neuroplasticity!"]
    
    let days = [true, false, false, true, true, false, true]
    let daysOfTheWeek = ["S", "M", "T", "W", "T", "F", "S"]
    
    var body: some View {
            if showingSchedule {
                ScheduleWorkoutView()
            }
            else {
                Home
            }
            
        }
    
    var Home: some View {
        ZStack {
            
            Color(0xFCF7EE).ignoresSafeArea()
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Text("Hi, Name")
                        .font(.system(size: 45))
                    Spacer()
                    Image("coin")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 20)
                    Text(" 1500")

                        .font(.system(size: 20))
                    
                }
                .fontWeight(.bold)
                .foregroundColor(Color(0x424B54))
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
                
                Text("Great job you're on a 1 day streak!")
                    .foregroundColor(Color(0x424B54))
                    .fontWeight(.bold)
                    .padding(.bottom, 5)
                    .font(.system(size: 20))
                VStack{
                    HStack(spacing: 20) {
                        ForEach(days,id: \.self) {day in
                            Image(systemName: day ? "circle.fill" : "circle")
                                .resizable()
                                .scaledToFit()
                                .frame(height:20)
                                .foregroundColor(Color(0xFCF7EE))
                        }
                    }
                    HStack(spacing: 28) {
                        ForEach(daysOfTheWeek,id: \.self) {day in
                            Text(day)
                                .foregroundColor(Color(0xFCF7EE))
                        }
                    }
                }
                .frame(width: 310)
                .padding()
                .background(Color("red"))
                .cornerRadius(12)
                .padding(.bottom, 15)
                
                
                Button {
                    self.showingSchedule = true
                    
                } label : {
                    Text("Schedule A Workout")
                        .lineLimit(nil)
                        .padding(.horizontal, 75)
                        .padding(.vertical, 15)
                        .background(Color("red"))
                        .cornerRadius(12)
                }
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(Color(0xFCF7EE))
                .padding(.bottom, 25)
                .buttonStyle(StaticButtonStyle())
                .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 4)
    
                
                
                
                Text("Friends")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(Color(0x424B54))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 10)
                    .padding(.bottom)
                    

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(0..<10) {_ in
                            VStack {
                                Button {
                                    
                                } label : {
                                    Image(systemName: "person.circle.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height:75)
                                        .foregroundColor(Color(0x424B54))
                                }
                                .buttonStyle(StaticButtonStyle())
                                
                                Text("Friend Name")
                                    .font(.system(size: 15))
                                    .foregroundColor(Color(0x424B54))
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
                                Button {
                                    
                                } label : {
                                    Image(systemName: "person.circle.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height:75)
                                        .foregroundColor(Color(0x424B54))
                                        .fontWeight(.medium)
                                }
                                .buttonStyle(StaticButtonStyle())
                                
                                Text("Group Name")
                                    .font(.system(size: 15))
                                    .foregroundColor(Color(0x424B54))
                                    .fontWeight(.medium)
                            }
                            .frame(width: 100)
                        }
                    }
                    .padding(.leading, 15)
                }
                .padding(.bottom, 25)
                
                /*Text("Motivation!")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(Color(0x424B54))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 10)
                    .padding(.bottom, 10)*/
                
                Text(tips.randomElement()!)
                    .frame(width: 350, height: 100)
                    .lineLimit(nil)
                    .background(Color("white").opacity(1.0))
                    .cornerRadius(12)
                    .font(.system(size: 20))
                    .foregroundColor(Color("black"))
                    .fontWeight(.medium)
                    .overlay(
                         RoundedRectangle(cornerRadius: 12)
                             .stroke(Color(0xFE2036), lineWidth: 2)
                    )
                
                
                    
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