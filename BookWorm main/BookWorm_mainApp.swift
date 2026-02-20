//
//  BookWorm_mainApp.swift
//  BookWorm main
//
//  Created by kalyan on 2/19/26.
//

import SwiftUI
import SwiftData

@main
struct BookWorm_mainApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
