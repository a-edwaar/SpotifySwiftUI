//
//  YourLibraryView.swift
//  SpotifyWithSwiftUI
//
//  Created by Archie Edwards on 07/06/2020.
//  Copyright © 2020 Archie Edwards. All rights reserved.
//

import SwiftUI
import SwiftUIPager

struct YourLibraryView: View {

    @State var page: Int = 0 //// keeps track of which category index we are at
    @State var nestedPages: [Int] = [0, 0] /// keeps track of which sub category index we are at for each category
    @State var indicatorOffsets : [CGFloat] = [0,0] /// keepts track of indicator offsets for each category
    @State var allowSubCategoryDragging = true

    var data = Array(0..<2)
    var nestedData = Array(0..<3)

    var body: some View {
        VStack{
            CategoryText(currentCategoryIndex: self.$page, nestedPages: self.$nestedPages)
            Pager(page: self.$page,
                  data: self.data,
                  id: \.self) { page in
                    self.nestedPager(page)
            }
            .onPageChanged({ _ in
                self.allowSubCategoryDragging = true
            })
            .swipeInteractionArea(.allAvailable)
            .simultaneousGesture(DragGesture().onChanged({value in
                /// catch moving to category
                if self.allowSubCategoryDragging {
                    let movingCategoryRight = self.page == 0 && self.nestedPages[self.page] == 2 && value.translation.width < 0
                    let movingCategoryLeft = self.page == 1 && self.nestedPages[self.page] == 0 && value.translation.width > 0
                    if movingCategoryRight || movingCategoryLeft{
                        self.allowSubCategoryDragging = false
                    }
                    else{
                        let westAsCanBe = self.nestedPages[self.page] == 0 && self.page == 0 && value.translation.width > 0
                        let eastAsCanBe = self.nestedPages[self.page] == 2 && self.page == 1 && value.translation.width < 0
                        if !westAsCanBe && !eastAsCanBe{
                            /// we must be moving sub categorys move the offset for the indicator
                            self.indicatorOffsets[self.page] = -value.translation.width/10
                        }
                    }
                }
            }).onEnded({ _ in
                self.indicatorOffsets[self.page] = 0
            }))
        }
    }

    /// nestedPager contains subcategory titles, an indicator and a pager to show subcategory views
    func nestedPager(_ index: Int) -> some View {
        let currentSubCategory = Binding<Int>(
            get: {
                self.nestedPages[index]
        }, set: { newValue in
            var newNestedPages = self.nestedPages
            newNestedPages[index] = newValue
            self.nestedPages = newNestedPages
        })
        
        let indicatorOffset = Binding<CGFloat>(
            get: {
                self.indicatorOffsets[index]
        }, set: { newValue in
            var newIndicatorOffsets = self.indicatorOffsets
            newIndicatorOffsets[index] = newValue
            self.indicatorOffsets = newIndicatorOffsets
        })

        return VStack(alignment: .leading, spacing: 20){
            SubCategoryText(subCategorys: index == 0 ? ["Playlists", "Albums", "Artists"] : ["Episodes", "Downloads", "Shows"], currentSubCategoryIndex: currentSubCategory, indicatorOffset: indicatorOffset)
            Pager(page: currentSubCategory,
                  data: self.nestedData,
                  id: \.self) { page in
                    MediaContentView()
            }
            .allowsDragging(allowSubCategoryDragging)
            Spacer()
        }
    }

}

struct YourLibraryView_Previews: PreviewProvider {
    static var previews: some View {
        YourLibraryView()
    }
}
