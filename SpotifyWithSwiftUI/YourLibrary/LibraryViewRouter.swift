//
//  LibraryViewRouter.swift
//  SpotifyWithSwiftUI
//
//  Created by Archie Edwards on 30/05/2020.
//  Copyright © 2020 Archie Edwards. All rights reserved.
//

import Foundation
import SwiftUI

class LibraryCategoryRouter : ObservableObject {
    @Published var category = 0
    let categorys = ["Music", "Podcasts"]
}

class LibrarySubCategoryRouter : ObservableObject {
    @Published var subCategory = 0
    var subCategorys = ["Playlists", "Artists", "Albums", "Episodes", "Downloads", "Shows"]
    func setSubCategory(sub : String){
        subCategory = subCategorys.firstIndex(of: sub) ?? 0
    }
}
