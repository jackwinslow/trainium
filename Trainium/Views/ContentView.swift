//
//  ContentView.swift
//  Trainium
//
//  Created by Jack Winslow on 11/13/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewRouter: ViewRouter
    @StateObject var authViewModel: AuthViewModel
    @StateObject var currentUser: CurrentUser
    @StateObject var users: Users
    
    @AppStorage("username") var username: String = ""
    
    var body: some View {
        ZStack {
            
            Color(0xFCF7EE).ignoresSafeArea()
            
            switch viewRouter.currentPage {
            case .home:
                HomeView(currentUser: currentUser)
            case .community:
                CommunityView(users: users)
            case .personal:
                PersonalView(authViewModel: authViewModel, currentUser: currentUser, users: users)
            }
            
            VStack(spacing: 0) {
                Spacer()
                
                Rectangle()
                .stroke(.black.opacity(0.08))
                .frame(height:1)
                .cornerRadius(6)
                
                HStack {
                    
                    Spacer()
                    
                    Button {
                        viewRouter.currentPage = .home
                    } label: {
                        VStack {
                            Image(systemName: viewRouter.currentPage == .home ? "dumbbell.fill" : "dumbbell")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 20)
                            
                            Text("Home")
                                .font(.system(size: 12))
                        }
                    }
                    .foregroundColor(viewRouter.currentPage == .home ? Color("red") : Color("black"))
                    
                    Spacer()
                    
                    Button {
                        viewRouter.currentPage = .community
                    } label: {
                        VStack {
                            Image(systemName: viewRouter.currentPage == .community ? "person.3.fill" : "person.3")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 20)
                            
                            Text("Community")
                                .font(.system(size: 12))
                        }
                    }
                    .foregroundColor(viewRouter.currentPage == .community ? Color("red") : Color("black"))
                    
                    Spacer()
                    
                    Button {
                        viewRouter.currentPage = .personal
                    } label: {
                        VStack {
                            Image(systemName: viewRouter.currentPage == .personal ? "person.crop.square.fill" : "person.crop.square")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 20)
                            
                            Text("Personal")
                                .font(.system(size: 12))
                        }
                    }
                    .foregroundColor(viewRouter.currentPage == .personal ? Color("red") : Color("black"))
                    
                    Spacer()

                }
                .padding(.top, 32)
                .frame(height: 40)
                .frame(maxWidth: .infinity)
                .background(Color("white"))
            }
            
        }
        .onChange(of: currentUser.friends, perform: { _ in
            users.fetchFriends(friends: currentUser.friends)
        })
        .onAppear {
            if currentUser.listener == nil && username != "" {
                currentUser.addListener(username: username) {
                    print("Added listener on current user from storage")
                }
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(viewRouter: ViewRouter(), authViewModel: AuthViewModel())
//    }
//}
