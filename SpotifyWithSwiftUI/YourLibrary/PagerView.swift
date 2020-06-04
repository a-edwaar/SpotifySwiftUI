//
//  PagerView.swift
//  SpotifyWithSwiftUI
//
//  Created by Archie Edwards on 01/06/2020.
//  Copyright © 2020 Archie Edwards. All rights reserved.
//

import SwiftUI

struct PagerView<Content: View>: View {
    var categoryPage = false
    let content: Content
    @Binding var translation: CGFloat
    @EnvironmentObject var libraryCategoryRouter : LibraryCategoryRouter
    @EnvironmentObject var librarySubCategoryRouter : LibrarySubCategoryRouter

    init(@ViewBuilder content: () -> Content, translation: Binding<CGFloat>) {
        self.content = content()
        self._translation = translation
    }
    
    init(categoryPage: Bool, @ViewBuilder content: () -> Content, translation: Binding<CGFloat>) {
        self.categoryPage = categoryPage
        self.content = content()
        self._translation = translation
    }

    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                self.content.frame(width: geometry.size.width)
            }
            .frame(width: geometry.size.width, alignment: .leading)
            .offset(x: self.categoryPage ? (-CGFloat(self.libraryCategoryRouter.category) * geometry.size.width) : (-CGFloat(self.librarySubCategoryRouter.subCategory) * geometry.size.width))
            .offset(x: self.translation)
            .animation(.easeInOut)
        }
    }
}

struct PagerView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }
    struct PreviewWrapper: View {
        @EnvironmentObject var libraryCategoryRouter : LibraryCategoryRouter
        @EnvironmentObject var librarySubCategoryRouter : LibrarySubCategoryRouter
        @State var translation : CGFloat = 0
        @State var indicatorOffset : CGFloat = 0
        var body: some View {
            PagerView(categoryPage: true, content: {
                Text("hello")
                Text("hello a")
            }, translation: self.$translation).environmentObject(LibraryCategoryRouter()).environmentObject(LibrarySubCategoryRouter())
        }
    }
}
