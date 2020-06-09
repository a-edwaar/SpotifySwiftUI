//
//  MediaContentView.swift
//  SpotifyWithSwiftUI
//
//  Created by Archie Edwards on 31/05/2020.
//  Copyright © 2020 Archie Edwards. All rights reserved.
//

import SwiftUI

struct MediaContentView: View {
    var mediaTitle : String
    var mediaSubtitle : String
    var colours : [Color] = [.red, .orange, .green, .pink, .purple, .yellow]
    var body: some View {
        HStack{
            Rectangle()
                .frame(width: UIScreen.main.bounds.size.width/6 , height: UIScreen.main.bounds.size.height/12)
                .foregroundColor(colours[Int.random(in: 0 ... 5 )])
            VStack(alignment: .leading){
                Text(mediaTitle).font(.headline).fixedSize(horizontal: true, vertical: false)
                Text(mediaSubtitle).font(.footnote).bold().foregroundColor(.secondary).fixedSize(horizontal: true, vertical: false)
            }
            Spacer()
        }
    }
}

struct MediaContentView_Previews: PreviewProvider {
    static var previews: some View {
        MediaContentView(mediaTitle: "Your Kitchen Stereo", mediaSubtitle: "by Spotify")
    }
}
