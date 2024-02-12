//
//  Safe_dataApp.swift
//  Safe data
//
//  Created by Ilia Ilinskii on 12/02/2024.
//

import SwiftUI
import SwiftData

@main
struct NotesAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                /// Setting Min Frame
                .frame(minWidth: 320, minHeight: 400)
        }
        .windowResizability(.contentSize)
        /// Adding Data Model to the App
        .modelContainer(for: [Note.self, NoteCategory.self])
    }
}
