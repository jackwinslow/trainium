//
//  OnBoardView.swift
//  Trainium
//
//  Created by Jack Winslow on 11/12/22.
//

import SwiftUI

struct OnBoardView: View {
    
    @StateObject var onBoardRouter: OnBoardRouter
    @State var buttonText: String = "Get Started"
    
    var body: some View {
        ZStack {
            Color(0xFCF7EE).ignoresSafeArea()
            
            VStack {
                switch onBoardRouter.currentPage {
                case .welcome:
                    WelcomeView()
                case .signup:
                    SignUpView()
                case .experience:
                    SetExperienceView()
                case .discovery:
                    SetDiscoveryView()
                case .friends:
                    SetFriendsView()
                }
                
                Spacer()
                
                Button {
                    switch onBoardRouter.currentPage {
                    case .welcome:
                        buttonText = "Continue"
                    case .signup:
                        buttonText = "Keep Going"
                    case .experience:
                        buttonText = "Almost There"
                    case .discovery:
                        buttonText = "Hop In!"
                    case .friends:
                        buttonText = ""
                    }
                    
                    onBoardRouter.currentPage.next()
                } label: {
                    ZStack {
                        HStack {
                            Spacer()
                            
                            if onBoardRouter.currentPage != .friends { Image(systemName: "arrow.right")
                            }
                        }
                        
                        Text(buttonText)
                            .animation(.none)
                        
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .fontWeight(.medium)
                    .foregroundColor(Color(0xFCF7EE))
                    .background(Color(0xFE2036))
                    .cornerRadius(12)
                }
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
        OnBoardView(onBoardRouter: OnBoardRouter())
    }
}
