//
//  LibraryView.swift
//  SpotifyWithSwiftUI
//
//  Created by Archie Edwards on 30/05/2020.
//  Copyright © 2020 Archie Edwards. All rights reserved.
//

import SwiftUI

struct LibraryView: View {
    var body: some View {
        VStack(spacing: 20){
            LibraryCategoryTextView()
            LibraryCategoryView()
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView().environmentObject(LibraryCategoryRouter()).environmentObject(LibrarySubCategoryRouter())
    }
}
