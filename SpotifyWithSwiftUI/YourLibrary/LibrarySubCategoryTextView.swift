//
//  LibrarySubCategoryTextView.swift
//  SpotifyWithSwiftUI
//
//  Created by Archie Edwards on 31/05/2020.
//  Copyright © 2020 Archie Edwards. All rights reserved.
//

import SwiftUI

struct LibrarySubCategoryTextView: View {
    @EnvironmentObject var librarySubCategoryRouter : LibrarySubCategoryRouter
    @Binding var indicatorOffset : CGFloat
    var subCategoryText : String
    var body: some View {
        VStack{
            Text(subCategoryText)
                .font(.headline)
                .foregroundColor(librarySubCategoryRouter.subCategorys[librarySubCategoryRouter.subCategory] == subCategoryText ? .primary : .secondary)
                .onTapGesture {
                    self.librarySubCategoryRouter.setSubCategory(sub: self.subCategoryText)
            }
            Rectangle()
                .frame(height: 2)
                .offset(x: self.indicatorOffset)
                .foregroundColor(librarySubCategoryRouter.subCategorys[librarySubCategoryRouter.subCategory] == subCategoryText ? .green : .clear)
        }.fixedSize().padding(.leading)
    }
}

struct LibrarySubCategoryTextView_Previews: PreviewProvider {
    static var previews: some View {
        LibrarySubCategoryTextView(indicatorOffset: .constant(0), subCategoryText: "Playlists").environmentObject(LibrarySubCategoryRouter())
    }
}
