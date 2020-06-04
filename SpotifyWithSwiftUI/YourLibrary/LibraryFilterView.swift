//
//  LibraryFilterView.swift
//  SpotifyWithSwiftUI
//
//  Created by Archie Edwards on 31/05/2020.
//  Copyright © 2020 Archie Edwards. All rights reserved.
//

import SwiftUI

struct LibraryFilterView: View {
    var subCategoryText : String
    @State var filterString = ""
    var body: some View {
        HStack{
            HStack{
                Image(systemName: "magnifyingglass")
                TextField("Find in \(subCategoryText)", text: $filterString)
            }
                .padding(.vertical, 10)
                .accentColor(.green)
                .cornerRadius(10)
            Spacer()
            Button(action: {
                
            }, label: {
                Text("Filters")
            })
                .padding(10)
                .cornerRadius(10)
        }.foregroundColor(.secondary)
    }
}

struct LibraryFilterView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryFilterView(subCategoryText: "playlists")
    }
}
