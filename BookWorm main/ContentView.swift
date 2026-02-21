//
//  ContentView.swift
//  BookWorm main
//
//  Created by kalyan on 2/19/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort:[SortDescriptor(\Book.title),
                 SortDescriptor(\Book.author),
                 SortDescriptor(\Book.rating)]) var books : [Book]
    
    @State private var showingSheet = false
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(books){book in
                    NavigationLink(value:book){
                        HStack{
                            EmojiView(rating: book.rating).font(.largeTitle)
                            VStack(alignment: .leading){
                                Text(book.author).foregroundStyle(.black)
                                    .font(.headline)
                                Text(book.title).foregroundStyle(book.rating == 1 ? .yellow : .gray).font(.subheadline)
                                Text(book.review).foregroundStyle(.gray).font(.subheadline)
                            }
                        }
                    }.background(book.rating == 1 ? .red : .primary)
                }.onDelete(perform: deletebooks)
                   
            }.sheet(isPresented: $showingSheet){
                AddBookView()
                    
            }
            
            .navigationDestination(for: Book.self){book in
                DetailView(book: book)
            }
            
            .navigationTitle("Book Worm").navigationBarTitleDisplayMode(.large)
                .toolbar{
                    ToolbarItem(placement: .topBarLeading){
                        EditButton()
                    }
                    
                    ToolbarItem(placement: .topBarTrailing){
                        Button("add", systemImage: "plus"){
                            showingSheet = true
                        }
                    }
                    
                }
        }
    }
    
    func deletebooks(at offsets : IndexSet){
        for offset in offsets{
            let book = books[offset]
            modelContext.delete(book)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Book.self, inMemory: true)
}
