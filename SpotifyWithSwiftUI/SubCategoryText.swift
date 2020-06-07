//
//  SubCategoryText.swift
//  SpotifyWithSwiftUI
//
//  Created by Archie Edwards on 07/06/2020.
//  Copyright © 2020 Archie Edwards. All rights reserved.
//

import SwiftUI

struct SubCategoryText: View {

    var subCategoryText : String
    var index : Int
    @Binding var currentIndex : Int
    @Binding var indicatorOffset : CGFloat
    var body: some View {
        VStack{
            Text(subCategoryText)
                .font(.headline)
                .foregroundColor(self.currentIndex == index ? .primary : .secondary)
                .onTapGesture {
                    withAnimation(.easeIn,{
                        self.currentIndex = self.index
                    })
                }
            Rectangle()
                .frame(height: 2)
                .offset(x: self.indicatorOffset)
                .foregroundColor(self.currentIndex == index ? .green : .clear)
                .animation(.none)
        }.fixedSize().padding(.leading)
    }
}

struct SubCategoryText_Previews: PreviewProvider {
    static var previews: some View {
        SubCategoryText(subCategoryText: "Playlists", index: 0, currentIndex: .constant(0), indicatorOffset: .constant(0))
    }
}
