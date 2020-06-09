//
//  SubCategoryText.swift
//  SpotifyWithSwiftUI
//
//  Created by Archie Edwards on 07/06/2020.
//  Copyright © 2020 Archie Edwards. All rights reserved.
//

import SwiftUI

struct SubCategoryText: View {

    var subCategorys : [String]
    @Binding var currentSubCategoryIndex : Int
    @Binding var indicatorOffset : CGFloat
    var body: some View {
        HStack{
            subCategory(index: 0, parent: self)
            subCategory(index: 1, parent: self)
            subCategory(index: 2, parent: self)
            Spacer()
        }
        
    }
    
    struct subCategory: View{
        var index: Int
        var parent: SubCategoryText
        var body: some View{
            VStack{
                Text(parent.subCategorys[index])
                    .font(.headline)
                    .foregroundColor(parent.currentSubCategoryIndex == index ? .primary : .secondary)
                    .onTapGesture {
                        withAnimation(.easeIn,{
                            self.parent.currentSubCategoryIndex = self.index
                        })
                    }
                Rectangle()
                    .frame(height: 2)
                    .offset(x: parent.indicatorOffset)
                    .foregroundColor(parent.currentSubCategoryIndex == index ? .green : .clear)
                    .animation(.none)
            }.fixedSize().padding(.leading)
        }
    }
}

struct SubCategoryText_Previews: PreviewProvider {
    static var previews: some View {
        SubCategoryTextPreview()
    }
    struct SubCategoryTextPreview : View{
        @State var currentSubCategoryIndex = 0
        @State var indicatorOffset: CGFloat = 0
        var body: some View{
            SubCategoryText(subCategorys: ["Playlists", "Albums", "Artists"], currentSubCategoryIndex: self.$currentSubCategoryIndex, indicatorOffset: self.$indicatorOffset)
        }
    }
}
