//
//  ScheduleWorkoutView.swift
//  Trainium
//
//  Created by Aidan Daly on 11/12/22.
//

import SwiftUI

struct ScheduleWorkoutView: View {
    
    @State private var date = Date()
    @State private var time = Date()
    @State var selectedPartners = Set<UUID>()
    @State var selectedGroup = Set<UUID>()
    
    var body: some View {
        ZStack {
            Color("white").ignoresSafeArea()
            VStack(spacing: 0) {
                Text("Schedule Workout")
                    .font(.system(size: 35))
                    .foregroundColor(Color("black"))
                    .fontWeight(.bold)
                    .padding(.top, 10)
                    .padding(.bottom, 20)
                
                DatePicker("Select a date", selection: $date, displayedComponents: .date)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .font(.system(size: 25))
                    .fontWeight(.medium)
                    .foregroundColor(Color("black"))
                
                DatePicker("Select a time", selection: $time, displayedComponents: .hourAndMinute)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .font(.system(size: 25))
                    .fontWeight(.medium)
                    .foregroundColor(Color("black"))
                
                Text("Select a group or partner(s)")
                    .foregroundColor(Color("black"))
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fontWeight(.bold)
                    .font(.system(size: 25))
                
                Text("Friends")
                    .font(.system(size: 25))
                    .fontWeight(.medium)
                    .foregroundColor(Color(0x424B54))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 10)
                    .padding(.horizontal, 15)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(0..<10) {_ in
                            VStack {
                                Button {
                                    /*
                                     if selectedPartners contains username:
                                     remove username from set
                                     change color of icon
                                     else:
                                     add username to set
                                     change color of icon
                                     */
                                } label : {
                                    Image(systemName: "person.circle.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height:75)
                                        .foregroundColor(Color(0x424B54))
                                }
                                
                                Text("Friend Name")
                                    .font(.system(size: 15))
                                    .foregroundColor(Color(0x424B54))
                            }
                            .frame(width: 100)
                        }
                    }
                }
                    .padding(.leading, 15)
                    
                    Text("Groups")
                        .font(.system(size: 25))
                        .fontWeight(.medium)
                        .foregroundColor(Color(0x424B54))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 15)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(0..<10) {_ in
                                VStack {
                                    Button {
                                        /*
                                         if group is selected
                                         clear set of partners chosen
                                         unselect other groups chosen
                                         add new group to group set
                                         change colors
                                         */
                                        
                                    } label : {
                                        Image(systemName: "person.circle.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height:75)
                                            .foregroundColor(Color(0x424B54))
                                            .fontWeight(.medium)
                                    }
                                    
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


                    
                    Spacer()
                
            } // VStack closing tag
        } // ZStack closing tag
    }
}

struct ScheduleWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleWorkoutView()
    }
}
