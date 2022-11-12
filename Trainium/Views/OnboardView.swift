//
//  OnBoardView.swift
//  Trainium
//
//  Created by Jack Winslow on 11/12/22.
//

import SwiftUI

struct OnBoardView: View {
    
//    @State var stage:
    
    var body: some View {
        ZStack {
            Color(0xFCF7EE).ignoresSafeArea()
            
            SignUpView()
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct OnBoardView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardView()
    }
}
