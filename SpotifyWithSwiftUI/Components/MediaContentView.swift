//
//  MediaContentView.swift
//  SpotifyWithSwiftUI
//
//  Created by Archie Edwards on 31/05/2020.
//  Copyright © 2020 Archie Edwards. All rights reserved.
//

import SwiftUI

struct MediaContentView: View {
    var colours : [Color] = [.red, .orange, .green, .pink, .purple, .yellow]
    var body: some View {
        ScrollView(.vertical, showsIndicators: true){
            ForEach(0..<10) {_ in
                HStack{
                    Rectangle()
                       .frame(width: UIScreen.main.bounds.size.width/6 , height: UIScreen.main.bounds.size.height/12)
                        .foregroundColor(self.colours[Int.random(in: 0 ... 5 )])
                    VStack(alignment: .leading){
                        Text("Insert Media").font(.headline).fixedSize(horizontal: true, vertical: false)
                        Text("by Spotify").font(.footnote).bold().foregroundColor(.secondary).fixedSize(horizontal: true, vertical: false)
                    }
                    Spacer()
                }
            }
        }.padding(.leading)
    }
}

struct MediaContentView_Previews: PreviewProvider {
    static var previews: some View {
        MediaContentView()
    }
}
