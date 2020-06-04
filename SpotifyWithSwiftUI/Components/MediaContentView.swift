//
//  MediaContentView.swift
//  SpotifyWithSwiftUI
//
//  Created by Archie Edwards on 31/05/2020.
//  Copyright © 2020 Archie Edwards. All rights reserved.
//

import SwiftUI

struct MediaContentView: View {
    //var image : Image
    var mediaTitle : String
    var mediaSubtitle : String
    var body: some View {
        HStack{
            Rectangle()
                .frame(width: UIScreen.main.bounds.size.width/6 , height: UIScreen.main.bounds.size.height/10)
            VStack(alignment: .leading){
                Text(mediaTitle).font(.headline).lineLimit(1)
                Text(mediaSubtitle).font(.footnote).bold().foregroundColor(.secondary).lineLimit(1)
            }
            Spacer()
        }
    }
}

//extension CGFloat {
//    static func random() -> CGFloat {
//        return CGFloat(arc4random()) / CGFloat(UInt32.max)
//    }
//}
//
//extension Color {
//    static func random() -> Color {
//        return Color(.sRGB, red: , green: .random(), blue: .random(), opacity: 1.0)
//    }
//}

struct MediaContentView_Previews: PreviewProvider {
    static var previews: some View {
        MediaContentView(mediaTitle: "Your Kitchen Stereo", mediaSubtitle: "by Spotify")
    }
}
