//
//  SearchView.swift
//  Trainium
//
//  Created by Aidan Daly on 11/13/22.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    var body: some View {
        ZStack {
            
            Color("white").ignoresSafeArea()
            VStack(spacing: 0) {
                NavigationView {
                    Text("")
                        .searchable(text: $searchText)
                        .navigationTitle("Search For a Friend")
                        .foregroundColor(Color("black"))
                }
                
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
                
                Spacer()
            }
        }
    }
}
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
