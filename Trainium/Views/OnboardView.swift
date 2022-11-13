//
//  OnBoardView.swift
//  Trainium
//
//  Created by Jack Winslow on 11/12/22.
//

import SwiftUI

struct OnBoardView: View {
    
    @StateObject var onBoardRouter: OnBoardRouter
    @StateObject var authViewModel: AuthViewModel
    
    @State var buttonText: String = "Get Started"
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var username: String = ""
    @State var password: String = ""
    @State var experience: String = "Beginner"
    @State var beDiscoverable: String = "Yes, make me discoverable"
    
    var body: some View {
        ZStack {
            Color(0xFCF7EE).ignoresSafeArea()
            
            VStack {
                
                if onBoardRouter.currentPage != .welcome {
                    HStack {
                        Button {
                            authViewModel.returnString = ""
                            onBoardRouter.currentPage.last()
                        } label: {
                            HStack {
                                Image(systemName: "arrow.left")
                                Text("Back")
                            }
                            
                        }
                        .fontWeight(.bold)
                        .foregroundColor(Color(0xFE2036))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .top])
                    
                }
                
                switch onBoardRouter.currentPage {
                case .welcome:
                    WelcomeView()
                case .signup:
                    SignUpView(firstName: $firstName, lastName: $lastName, email: $email, username: $username, password: $password)
                case .signin:
                    SignInView(email: $email, password: $password)
                case .experience:
                    SetExperienceView(selection: $experience)
                case .discovery:
                    SetDiscoveryView(selection: $beDiscoverable)
                }
                
                Spacer()
                
                Text(authViewModel.returnString)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(0xFE2036).opacity(0.8))
                    .font(.system(size: 16))
                    .fontWeight(.regular)
                
                if onBoardRouter.currentPage == .welcome {
                    Button {
                        onBoardRouter.currentPage = .signin
                        buttonText = "Hop Back In!"
                    } label: {
                        ZStack {
                            HStack {
                                Spacer()
                                
                                Image(systemName: "arrow.right")
                            }
                            
                            Text("Sign In")
                            
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .fontWeight(.bold)
                        .foregroundColor(Color(0xFE2036))
                        .background(Color(0xFCF7EE))
                        .cornerRadius(12)
                    }
                    .buttonStyle(StaticButtonStyle())
                    .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 4)
                    .overlay(
                         RoundedRectangle(cornerRadius: 12)
                             .stroke(Color(0xFE2036), lineWidth: 2)
                    )
                    .padding(.horizontal, 32)
                    .padding(.bottom, 8)

                }
                
                Button {
                    
                    if onBoardRouter.currentPage != .discovery && onBoardRouter.currentPage != .signin {
                        onBoardRouter.currentPage.next()
                        switch onBoardRouter.currentPage {
                        case .welcome:
                            buttonText = "Get Started"
                        case .signup:
                            buttonText = "Continue"
                        case .signin:
                            buttonText = "Hop Back In!"
                        case .experience:
                            buttonText = "Almost There"
                        case .discovery:
                            buttonText = "Hop In!"
                        }
                    } else if onBoardRouter.currentPage == .signin {
                        authViewModel.returnString = ""
                        authViewModel.signIn(email: email, password: password)
                    } else {
                        authViewModel.returnString = ""
                        authViewModel.signUp(firstName: firstName, lastName: lastName, username: username, email: email, password: password, experienceLevel: experience, beDiscoverable: beDiscoverable)
                    }
                } label: {
                    ZStack {
                        HStack {
                            Spacer()
                            
                            if onBoardRouter.currentPage != .discovery { Image(systemName: "arrow.right")
                            }
                        }
                        
                        Text(buttonText)
                            .animation(.none)
                        
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .fontWeight(.bold)
                    .foregroundColor(Color(0xFCF7EE))
                    .background(Color(0xFE2036))
                    .cornerRadius(12)
                }
                .buttonStyle(StaticButtonStyle())
                .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 4)
                .padding([.horizontal, .bottom], 32)
            }
            
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct OnBoardView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardView(onBoardRouter: OnBoardRouter(), authViewModel: AuthViewModel())
    }
}
