//
//  CategoryText.swift
//  SpotifyWithSwiftUI
//
//  Created by Archie Edwards on 07/06/2020.
//  Copyright © 2020 Archie Edwards. All rights reserved.
//

import SwiftUI

struct CategoryText: View {
    @Binding var currentCategoryIndex : Int
    @Binding var nestedPages : [Int]
    var body: some View {
        HStack{
            Text("Music")
                .font(.largeTitle).bold()
                .foregroundColor(self.currentCategoryIndex == 0 ? .primary : .secondary)
                .onTapGesture {
                    self.nestedPages = [0,0]
                    withAnimation(.easeIn,{
                        self.currentCategoryIndex = 0
                    })
                }
            Text("Podcasts")
                .font(.largeTitle).bold()
                .foregroundColor(self.currentCategoryIndex == 1 ? .primary : .secondary)
                .onTapGesture {
                    self.nestedPages = [0,0]
                    withAnimation(.easeIn,{
                        self.currentCategoryIndex = 1
                    })
                }
            Spacer()
        }.padding([.leading, .top])
    }
}

struct CategoryText_Previews: PreviewProvider {
    static var previews: some View {
        CategoryText(currentCategoryIndex: .constant(1), nestedPages: .constant([0,0]))
    }
}
