//
//  PagerView.swift
//  SpotifyWithSwiftUI
//
//  Created by Archie Edwards on 01/06/2020.
//  Copyright © 2020 Archie Edwards. All rights reserved.
//

import SwiftUI

struct PagerView<Content: View, G: Gesture>: View {
    let content: Content
    let gesture: G
    @Binding var translation: CGFloat
    @EnvironmentObject var libraryCategoryRouter : LibraryCategoryRouter
    @EnvironmentObject var librarySubCategoryRouter : LibrarySubCategoryRouter


    init(@ViewBuilder content: () -> Content, gesture: G, translation: Binding<CGFloat>) {
        self.content = content()
        self.gesture = gesture
        self._translation = translation
    }

    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                self.content.frame(width: geometry.size.width)
            }
            .frame(width: geometry.size.width, alignment: .leading)
            .offset(x: -CGFloat(self.librarySubCategoryRouter.subCategory) * geometry.size.width)
            .offset(x: self.translation)
            .animation(.easeInOut)
            .gesture(self.gesture)
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
        var body: some View {
            GeometryReader { geometry in
                
                PagerView(content: {
                LibrarySubCategoryView()
                LibrarySubCategoryView()
                LibrarySubCategoryView()
                }, gesture: DragGesture().onChanged{ (value) in
                    self.translation = value.translation.width
                }.onEnded { value in
                    let offset = value.translation.width / geometry.size.width
                    let newIndex = (CGFloat(self.librarySubCategoryRouter.subCategory) - offset).rounded()
                    let currentIndex = min(max(Int(newIndex), 0), 2)
                    if currentIndex == self.librarySubCategoryRouter.subCategory && currentIndex == 2 {
                        /// we are at the end
                        self.libraryCategoryRouter.category = 1
                    }else{
                        self.librarySubCategoryRouter.subCategory = currentIndex
                    }
                    self.translation = 0
                }, translation: self.$translation ).environmentObject(LibraryCategoryRouter()).environmentObject(LibrarySubCategoryRouter())
            }
        }
    }
}
