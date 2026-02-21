//
//  AddBookView.swift
//  BookWorm main
//
//  Created by kalyan on 2/19/26.
//
import SwiftData
import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre  = "Fantasy"
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationStack{
            List{
                Section{
                    TextField("Enter your book title", text: $title)
                    TextField("Enter your author", text: $author)
                    Picker("Pick your genre", selection: $genre){
                        ForEach(genres, id: \.self){
                            Text($0)
                        }
                    }
                }
                
                Section{
                    ZStack(alignment: .leading){
                        if review.isEmpty{
                            Text("write a review")
                                .foregroundStyle(.gray)
                                .padding(.top,8)
                        }
                        TextEditor(text: $review).frame(height: 200).scrollContentBackground(.hidden)
                        
                       
                    }
                    
                    Section{
                        Rating(rating: $rating)
                    }
                   
                }
                    Section{
                        Button("save"){
                            let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                            modelContext.insert(newBook)
                            dismiss()
                        }
                    }
                
            }.navigationTitle("Add Book").navigationBarTitleDisplayMode(.inline)
        }
       
    }
}

#Preview {
    AddBookView()
}
