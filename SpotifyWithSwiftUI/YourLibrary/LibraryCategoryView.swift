//
//  LibraryCategoryView.swift
//  SpotifyWithSwiftUI
//
//  Created by Archie Edwards on 30/05/2020.
//  Copyright © 2020 Archie Edwards. All rights reserved.
//

import SwiftUI

struct LibraryCategoryView: View {
    
    @EnvironmentObject var libraryCategoryRouter : LibraryCategoryRouter
    @EnvironmentObject var librarySubCategoryRouter : LibrarySubCategoryRouter
    @State var categoryTranslation : CGFloat = 0
    @State var subCategoryTranslation : CGFloat = 0
    @State var indicatorOffset : CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 20){
                
                PagerView(categoryPage: true, content: {
                    HStack{
                        LibrarySubCategoryTextView(indicatorOffset: self.$indicatorOffset, subCategoryText: self.librarySubCategoryRouter.subCategorys[0])
                        LibrarySubCategoryTextView(indicatorOffset: self.$indicatorOffset,subCategoryText: self.librarySubCategoryRouter.subCategorys[1])
                        LibrarySubCategoryTextView(indicatorOffset: self.$indicatorOffset,subCategoryText: self.librarySubCategoryRouter.subCategorys[2])
                        Spacer()
                    }
                    HStack{
                        LibrarySubCategoryTextView(indicatorOffset: self.$indicatorOffset, subCategoryText: self.librarySubCategoryRouter.subCategorys[3])
                        LibrarySubCategoryTextView(indicatorOffset: self.$indicatorOffset,subCategoryText: self.librarySubCategoryRouter.subCategorys[4])
                        LibrarySubCategoryTextView(indicatorOffset: self.$indicatorOffset,subCategoryText: self.librarySubCategoryRouter.subCategorys[5])
                        Spacer()
                    }
                    }, translation: self.$categoryTranslation).fixedSize(horizontal: false, vertical: true)
                
                PagerView(content: {
                    LibrarySubCategoryView()
                    LibrarySubCategoryView()
                    LibrarySubCategoryView()
                    LibrarySubCategoryView()
                    LibrarySubCategoryView()
                    LibrarySubCategoryView()
                }, translation: self.$subCategoryTranslation)
                
            }.gesture(
                DragGesture().onChanged{ (value) in
                    if (self.librarySubCategoryRouter.subCategory == 2 && value.translation.width < self.categoryTranslation) || (self.librarySubCategoryRouter.subCategory == 3 &&
                    value.translation.width > self.categoryTranslation){
                        /// we are changing category
                        self.categoryTranslation = value.translation.width
                    }
                    self.subCategoryTranslation = value.translation.width
                    self.indicatorOffset = -value.translation.width/5
            }.onEnded { value in
                let offset = value.translation.width / geometry.size.width
                let newIndex = (CGFloat(self.librarySubCategoryRouter.subCategory) - offset).rounded()
                let currentIndex = min(max(Int(newIndex), 0), self.librarySubCategoryRouter.subCategorys.count-1)
                self.librarySubCategoryRouter.subCategory = currentIndex
                if currentIndex == 3 {
                    /// we are in second category
                    self.libraryCategoryRouter.category = 1
                }else if currentIndex == 2{
                    /// we are in first category
                    self.libraryCategoryRouter.category = 0
                }
                self.subCategoryTranslation = 0
                self.categoryTranslation = 0
                self.indicatorOffset = 0
            })
        }
    }
}

struct LibraryCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryCategoryView().environmentObject(LibraryCategoryRouter()).environmentObject(LibrarySubCategoryRouter())
    }
}
