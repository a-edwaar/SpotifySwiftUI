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
    @State var translation : CGFloat = 0
    @State var indicatorOffset : CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
                
                VStack{
                    
                    HStack{
                        LibrarySubCategoryTextView(indicatorOffset: self.$indicatorOffset, subCategoryText: self.librarySubCategoryRouter.subCategorys[0])
                        LibrarySubCategoryTextView(indicatorOffset: self.$indicatorOffset,subCategoryText: self.librarySubCategoryRouter.subCategorys[1])
                        LibrarySubCategoryTextView(indicatorOffset: self.$indicatorOffset,subCategoryText: self.librarySubCategoryRouter.subCategorys[2])
                        Spacer()
                    }
                    
                    PagerView(content: {
                        LibrarySubCategoryView()
                        LibrarySubCategoryView()
                        LibrarySubCategoryView()
                    }, gesture: DragGesture().onChanged{ (value) in
                        self.translation = value.translation.width
                        self.indicatorOffset = -value.translation.width/5
                    }.onEnded { value in
                        let offset = value.translation.width / geometry.size.width
                        let newIndex = (CGFloat(self.librarySubCategoryRouter.subCategory) - offset).rounded()
                        let currentIndex = min(max(Int(newIndex), 0), 2)
                        self.librarySubCategoryRouter.subCategory = currentIndex
                        self.translation = 0
                        self.indicatorOffset = 0
                    }, translation: self.$translation)
                }
        }
    }
}

struct LibraryCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryCategoryView().environmentObject(LibraryCategoryRouter()).environmentObject(LibrarySubCategoryRouter())
    }
}
