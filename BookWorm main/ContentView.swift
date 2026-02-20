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
    @Query var books : [Book]
    
    @State private var showingSheet = false
    
    var body: some View {
        NavigationStack{
            List{
                Text("Books : \(books.count)")
                ForEach(books){book in
                    VStack(alignment: .leading){
                        Text(book.author).foregroundStyle(.black)
                            .font(.headline)
                        Text(book.title).foregroundStyle(.gray).font(.subheadline)
                        Text(book.review).foregroundStyle(.gray).font(.subheadline)
                    }
                    
                }
                   
            }.sheet(isPresented: $showingSheet){
                AddBookView()
            } .navigationTitle("Book Worm").navigationBarTitleDisplayMode(.large)
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing){
                        Button("add", systemImage: "plus"){
                            showingSheet.toggle()
                        }
                    }
                    
                }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Book.self, inMemory: true)
}
