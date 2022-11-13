//
//  SearchView.swift
//  Trainium
//
//  Created by Aidan Daly on 11/13/22.
//

import SwiftUI

struct CommunityView: View {
    
    @StateObject var users: Users
    @State var keyword = ""
    
    var body: some View {
        
        let keywordBinding = Binding<String>(
            get: {
                keyword
            },
            set: {
                keyword = $0
                users.fetchUsers(with: keyword)
            }
        )
        
        VStack {
            SearchBarView(users: users, keyword: keywordBinding)
            ScrollView {
                ForEach(users.queryResultUsers, id: \.username) { user in
                    ProfileBarView(users: users, user: user)
                }
            }
            .frame(maxHeight:.infinity)
            
            Text("Featured Groups")
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
            .padding(.bottom, 60)
        }
        .navigationBarHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onTapGesture {
            hideKeyboard()
        }
//        ZStack {
//
//            Color("white").ignoresSafeArea()
//            VStack(spacing: 0) {
//                NavigationView {
//                    Text("")
//                        .searchable(text: $searchText)
//                        .navigationTitle("Search For a Friend")
//                        .foregroundColor(Color("black"))
//                }
//
//                Text("Friends")
//                    .font(.system(size: 30))
//                    .fontWeight(.bold)
//                    .foregroundColor(Color(0x424B54))
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding(.horizontal, 10)
//                    .padding(.bottom)
//
//
//                ScrollView(.horizontal, showsIndicators: false) {
//                    HStack(spacing: 12) {
//                        ForEach(0..<10) {_ in
//                            VStack {
//                                Button {
//
//                                } label : {
//                                    Image(systemName: "person.circle.fill")
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(height:75)
//                                        .foregroundColor(Color(0x424B54))
//                                }
//                                .buttonStyle(StaticButtonStyle())
//
//                                Text("Friend Name")
//                                    .font(.system(size: 15))
//                                    .foregroundColor(Color(0x424B54))
//                            }
//                            .frame(width: 100)
//                        }
//                    }
//                    .padding(.leading, 15)
//                }
//                .padding(.bottom, 25)
//
//                Spacer()
//            }
//        }
    }
}
//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        CommunityView()
//    }
//}

struct SearchBarView: View {
    @StateObject var users: Users
    @Binding var keyword: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.gray.opacity(0.5))
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Searching for...", text: $keyword)
                .autocapitalization(.none)
            }
            .padding(.leading, 13)
        }
        .frame(height: 40)
        .cornerRadius(13)
        .padding()
    }
}

struct ProfileBarView: View {
    @StateObject var currentUser = CurrentUser.shared
    @StateObject var users: Users
    var user: User
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("red").opacity(0.2))
            HStack {
                VStack(alignment: .leading) {
                    Text("\(user.username)")
                    Text("\(user.firstName) \(user.lastName)")
                }
                
                Spacer()
                
                if currentUser.friends.contains(user.username) {
                    Text("Friends")
                } else {
                    Button {
                        users.sendFriendRequest(requestUser: user.username)
                    } label: {
                        Text("Send Request")
                    }
                }

            }
            .padding(.horizontal, 10)
        }
        .frame(maxWidth: .infinity, minHeight: 100)
        .cornerRadius(13)
        .padding()
    }
}
