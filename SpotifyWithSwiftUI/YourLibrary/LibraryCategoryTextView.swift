//
//  LibraryCategoryTextView.swift
//  SpotifyWithSwiftUI
//
//  Created by Archie Edwards on 01/06/2020.
//  Copyright © 2020 Archie Edwards. All rights reserved.
//

import SwiftUI

struct LibraryCategoryTextView: View {
    @EnvironmentObject var libraryCategoryRouter : LibraryCategoryRouter
    @EnvironmentObject var librarySubCategoryRouter : LibrarySubCategoryRouter
    var body: some View {
        HStack{
            Text("Music")
                .font(.largeTitle).bold()
                .foregroundColor(libraryCategoryRouter.categorys[libraryCategoryRouter.category] == "Music" ? .primary : .secondary)
                .onTapGesture {
                    self.libraryCategoryRouter.category = 0
                    self.librarySubCategoryRouter.subCategory = 0
                }
            Text("Podcasts")
                .font(.largeTitle).bold()
                .foregroundColor(libraryCategoryRouter.categorys[libraryCategoryRouter.category] == "Podcasts" ? .primary : .secondary)
                .onTapGesture {
                    self.libraryCategoryRouter.category = 1
                    self.librarySubCategoryRouter.subCategory = 3
                }
            Spacer()
        }.padding([.leading, .top])
    }
}

struct LibraryCategoryTextView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryCategoryTextView().environmentObject(LibraryCategoryRouter()).environmentObject(LibrarySubCategoryRouter())
    }
}
