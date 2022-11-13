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
            
            Color(0xFCF7EE).ignoresSafeArea()
            VStack(spacing: 0) {
                NavigationView {
                            Text("Searching for \(searchText)")
                                .searchable(text: $searchText)
                                .navigationTitle("Search For a Friend")
                        }
            }
        }
    }
}
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
