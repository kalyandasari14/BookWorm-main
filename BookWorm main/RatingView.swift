//
//  Rating.swift
//  BookWorm main
//
//  Created by kalyan on 2/19/26.
//

import SwiftUI

struct Rating: View {
    @Binding var rating: Int
    
    var label = ""
    var maximumrating = 5
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    
    var body: some View {
        HStack{
            if label.isEmpty == false{
                Text(label)
            }
            
            ForEach(1..<maximumrating + 1 , id: \.self){ number in
                Button(){
                    rating = number
                } label: {
                    image(number: number).foregroundStyle(number > rating ? offColor : onColor )
                }
            }
        }.buttonStyle(.plain)
    }
    func image(number: Int) -> Image{
        if number > rating{
            offImage ?? onImage
        } else{
            onImage
        }
        
    }
}

#Preview {
    Rating(rating: .constant(3))
}
