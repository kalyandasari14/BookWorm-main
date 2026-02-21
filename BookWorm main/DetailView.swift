//
//  DetailView.swift
//  BookWorm main
//
//  Created by kalyan on 2/20/26.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var showingAlert = false
    let book : Book
    var body: some View {
        ScrollView{
            ZStack(alignment: .bottomTrailing){
                Image(book.genre)
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre.uppercased())
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .background(.black.opacity(0.75))
                    .clipShape(.capsule)
                    .offset(x: -5, y: -5)
                    .foregroundStyle(.white)
                
                
                    
                
            }
            Text(book.author).font(.title)
                .foregroundStyle(.secondary)
             Spacer()
            Text(book.review).font(.caption)
                .foregroundStyle(.black)
            Spacer()
          
            Rating(rating: .constant(book.rating))
                .font(.largeTitle)
            
        }.navigationTitle(book.title)
            .navigationBarTitleDisplayMode(.inline)
            .scrollBounceBehavior(.basedOnSize)
            .alert("Delete Book", isPresented: $showingAlert){
                Button("Delete", role: .destructive, action: deleteBook)
                Button("Cancel", role: .cancel){}
            } message: {
                Text("Are you sure ??")
            }
            .toolbar{
                Button("Trash button", systemImage: "trash"){
                    showingAlert = true
                }
            }
    }
    
    func deleteBook(){
        modelContext.delete(book)
            dismiss()
    }
}

#Preview {
    do{
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let example = Book(title: "mikey", author: "fuck i dont know", genre: "Fantasy", review: "Fuck i dont even care", rating: 5)
        
        return DetailView(book: example)
            .modelContainer(container)
    } catch {
        return Text("This is an nvalid preview and the reason bieng \(error.localizedDescription)")
    }
}
