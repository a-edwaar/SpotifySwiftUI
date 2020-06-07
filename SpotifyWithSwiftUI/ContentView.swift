//
//  ContentView.swift
//  SpotifyWithSwiftUI
//
//  Created by Archie Edwards on 30/05/2020.
//  Copyright © 2020 Archie Edwards. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        YourLibraryView().edgesIgnoringSafeArea(.bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
