//
//  LibrarySubCategoryView.swift
//  SpotifyWithSwiftUI
//
//  Created by Archie Edwards on 30/05/2020.
//  Copyright © 2020 Archie Edwards. All rights reserved.
//

import SwiftUI

struct LibrarySubCategoryView: View {
    @EnvironmentObject var librarySubCategoryRouter : LibrarySubCategoryRouter
    @State var filterString = ""
    var body: some View {
        ScrollView(.vertical, showsIndicators: true){
            HStack{
                VStack{
                    LibraryFilterView(subCategoryText: librarySubCategoryRouter.subCategorys[librarySubCategoryRouter.subCategory].lowercased())
                    ForEach(0..<10) {_ in
                        MediaContentView(mediaTitle: "Playlist", mediaSubtitle: "by Spotify")
                    }
                }
                Spacer()
            }.padding(.leading)
        }
    }
}

struct LibrarySubCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        LibrarySubCategoryView().environmentObject(LibrarySubCategoryRouter())
    }
}
