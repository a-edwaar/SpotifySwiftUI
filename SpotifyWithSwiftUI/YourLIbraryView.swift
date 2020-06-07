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
    @State var nestedPages: [Int] = [0, 0] /// keeps track of which sub category index we are at
    @State var allowSubCategoryDragging = true /// a bool to temp switch sub category dragging off when we want to switch category
    @State var musicOffset : CGFloat = 0
    @State var podcastsOffset : CGFloat = 0

    var data = Array(0..<2)
    var nestedData = Array(0..<3)

    var body: some View {
        VStack{
            CategoryText(currentCategoryIndex: self.$page, nestedPages: self.$nestedPages)
            Pager(page: self.$page,
                  data: self.data,
                  id: \.self) { page in
                    self.nestedPager(page)
            }.onPageChanged({ _ in
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
                    }else{
                        let westAsCanBe = self.nestedPages[self.page] == 0 && self.page == 0 && value.translation.width > 0
                        let eastAsCanBe = self.nestedPages[self.page] == 2 && self.page == 1 && value.translation.width < 0
                        if !westAsCanBe && !eastAsCanBe{
                            /// we must be moving sub categorys move the offset for the indicator
                            if self.page == 0{
                                self.musicOffset = -value.translation.width/10
                            }else{
                                self.podcastsOffset = -value.translation.width/10
                            }
                        }
                    }
                }
            }).onEnded({ _ in
                if self.page == 0 {
                    self.musicOffset = 0
                }else{
                    self.podcastsOffset = 0
                }
            }))
        }
    }

    /// nestedPager contains subcategory titles, an indicator and a pager to show subcategory views
    func nestedPager(_ index: Int) -> some View {
        let binding = Binding<Int>(
            get: {
                self.nestedPages[index]
        }, set: { newValue in
            var newNestedPages = self.nestedPages
            newNestedPages[index] = newValue
            self.nestedPages = newNestedPages
        })

        return VStack(alignment: .leading, spacing: 20){
            HStack{
                SubCategoryText(subCategoryText: index == 0 ? "Playlists" : "Episodes" , index: 0, currentIndex: binding, indicatorOffset: index == 0 ? self.$musicOffset : self.$podcastsOffset)
                SubCategoryText(subCategoryText: index == 0 ? "Albums" : "Downloaded" , index: 1, currentIndex: binding, indicatorOffset: index == 0 ? self.$musicOffset : self.$podcastsOffset)
                SubCategoryText(subCategoryText: index == 0 ? "Artists" : "Shows" , index: 2, currentIndex: binding, indicatorOffset: index == 0 ? self.$musicOffset : self.$podcastsOffset)
                Spacer()
            }
            Pager(page: binding,
                  data: self.nestedData,
                  id: \.self) { page in
                    self.pageView(page)
            }.allowsDragging(allowSubCategoryDragging)
            Spacer()
        }
    }

    func pageView(_ page: Int) -> some View {
        ScrollView(.vertical, showsIndicators: true){
            ForEach(0..<10) {_ in
                MediaContentView(mediaTitle: "Insert Media", mediaSubtitle: "by Spotify")
            }
        }.padding(.leading)
    }

}

struct YourLibraryView_Previews: PreviewProvider {
    static var previews: some View {
        YourLibraryView()
    }
}
