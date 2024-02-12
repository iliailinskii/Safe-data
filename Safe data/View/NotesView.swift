//
//  NotesView.swift
//  Safe data
//
//  Created by Ilia Ilinskii on 12/02/2024.
//

import SwiftUI
import SwiftData

struct NotesView: View {
    var category: String?
    var allCategories: [NoteCategory]
    /// Notes
    @Query private var notes: [Note]
    init(category: String?, allCategories: [NoteCategory]) {
        self.category = category
        self.allCategories = allCategories
        /// Dynamic Filtering
        let predicate = #Predicate<Note> {
            return $0.category?.categoryTitle == category
        }
        
        let favouritePredicate = #Predicate<Note> {
            return $0.isFavourite
        }
        
        let finalPredicate = category == "All Notes" ? nil : (category == "Favourites" ? favouritePredicate : predicate)
        
        _notes = Query(filter: finalPredicate, sort: [], animation: .snappy)
    }
    
    /// View Properties
    @FocusState private var isKeyboardEnabled: Bool
    /// Model Context
    @Environment(\.modelContext) private var context
    var body: some View {
        VStack {
                List {
                    ForEach(notes) { note in
                        NavigationLink( destination: {
                            if note.type?.typeValue == "classic" {
                                ClassicNote(note: note)
                            } else if note.type?.typeValue == "card" {
                               CardNote(note: note)
                            } else if note.type?.typeValue == "password" {
                               CardNote(note: note)
                             }
                              else {
                                // Handle other types or provide a default view
                                ClassicNote(note: note)}
                        }
                        ) {
                            NoteCardView(note: note, isKeyboardEnabled: $isKeyboardEnabled)}
                            .contextMenu {
                                Button(note.isFavourite ? "Remove from Favourites" : "Move to Favourites") {
                                    note.isFavourite.toggle()
                                }
                                
                                Menu {
                                    ForEach(allCategories) { category in
                                        Button {
                                            /// Updating Category
                                            note.category = category
                                        } label: {
                                            HStack(spacing: 5) {
                                                if category == note.category {
                                                    Image(systemName: "checkmark")
                                                        .font(.caption)
                                                }
                                                
                                                Text(category.categoryTitle)
                                            }
                                            
                                        }
                                    }
                                    
                                    
                                    Button("Remove from Categories") {
                                        note.category = nil
                                    }
                                } label: {
                                    Text("Category")
                                }
                                
                                Button("Delete", role: .destructive) {
                                    context.delete(note)
                                }
                                
                            }
                    }
                }
                .onTapGesture {
                    isKeyboardEnabled = false
                }
                
            }

    }
}

/// Note Card View
/// With Editable TF
struct NoteCardView: View {
    @Bindable var note: Note
    var isKeyboardEnabled: FocusState<Bool>.Binding
    @State private var showNote: Bool = false
    @Environment(\.modelContext) private var context
    
    var body: some View {
        ZStack(alignment: .leading) {
///#error  addd swipes
            if showNote {
                    Text(note.titleText ?? "")
                    .font(.headline)
                    .multilineTextAlignment(.leading)
            }
        }
        .padding(5)
        .background()
        .swipeActions (allowsFullSwipe: false) {
            Button {
                    context.delete(note)
            } label: {
                Label("Delete", systemImage: "trash")
            }
            .tint(.red)}
        .swipeActions (allowsFullSwipe: false) {
            Button {
                    note.isFavourite.toggle()
            } label: {
                Label("Favorite", systemImage: "star")
            }
            .tint(.yellow)}
        .onAppear {
            showNote = true
        }
        .onDisappear {
            showNote = false
        }
    }

}




