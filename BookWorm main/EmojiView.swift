//
//  EmojiView.swift
//  BookWorm main
//
//  Created by kalyan on 2/20/26.
//

import SwiftUI

struct EmojiView: View {
    var rating: Int
    var body: some View {
        switch rating{
        case 1 :
            Text("😭")
        case 2 :
            Text("🙄")
        case 3 :
            Text("👍")
        case 4 :
            Text("😊")
        default :
            Text("☺️")
        }
    }
}

#Preview {
    EmojiView(rating: 3)
}
