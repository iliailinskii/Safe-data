//
//  Home.swift
//  Safe data
//
//  Created by Ilia Ilinskii on 12/02/2024.
//

import SwiftUI
import SwiftData

struct Home: View {
    /// List Selection (Going to use this as a Tab to filter the selected cateogry notes)
    @State private var selectedTag: String? = "All Notes"
    /// Quering All Categories
    @Query(animation: .snappy) private var categories: [NoteCategory]
    /// Model Context
    @Environment(\.modelContext) private var context
    /// View Properties
    @State private var addCategory: Bool = false
    @State private var categoryTitle: String = ""
    @State private var requestedCategory: NoteCategory?
    @State private var deleteRequest: Bool = false
    @State private var renameRequest: Bool = false
    /// Dark Mode Toggle
    @State private var isDark: Bool = true
    @State private var selectedOption: Int? = nil
        
    var body: some View {
        NavigationSplitView {
            List(selection: $selectedTag) {
                Text("All Notes")
                    .tag("All Notes")
                    .foregroundStyle(selectedTag == "All Notes" ? Color.primary : .gray)
                
                Text("Favourites")
                    .tag("Favourites")
                    .foregroundStyle(selectedTag == "Favourites" ? Color.primary : .gray)
                
                /// User Created Categories
                Section {
                    ForEach(categories) { category in
                        Text(category.categoryTitle)
                            .tag(category.categoryTitle)
                            .foregroundStyle(selectedTag == category.categoryTitle ? Color.primary : .gray)
                            /// Some basic Editing Options
                            .contextMenu {
                                Button("Rename") {
                                    /// Placing the Already Having title in the TextField
                                    categoryTitle = category.categoryTitle
                                    requestedCategory = category
                                    renameRequest = true
                                }
                                
                                Button("Delete") {
                                    categoryTitle = category.categoryTitle
                                    requestedCategory = category
                                    deleteRequest = true
                                }
                            }
                    }
                } header: {
                    HStack(spacing: 5) {
                        Text("Categories")
                        
                        Button("", systemImage: "plus") {
                            addCategory.toggle()
                        }
                        .padding(.top, -4.0)
                        .frame(height: 1.0)
                        .tint(.gray)
                        .buttonStyle(.plain)
                        
                    }
                }
            }
        } detail: {
            /// Notes View With Dynamic Filtering Based on the Category
            NotesView(category: selectedTag, allCategories: categories)
        }
        .navigationTitle(selectedTag ?? "Notes")
        /// Adding Category Alert
        .alert("Add Category", isPresented: $addCategory) {
            TextField("Work", text: $categoryTitle)
            
            Button("Cancel", role: .cancel) {
                categoryTitle = ""
            }
            
            Button("Add") {
                /// Adding New Category to Swift Data
                let category = NoteCategory(categoryTitle: categoryTitle)
                context.insert(category)
                categoryTitle = ""
            }
        }
        /// Rename Alert
        .alert("Rename Category", isPresented: $renameRequest) {
            TextField("Work", text: $categoryTitle)
            
            Button("Cancel", role: .cancel) {
                categoryTitle = ""
                requestedCategory = nil
            }
            
            Button("Rename") {
                if let requestedCategory {
                    requestedCategory.categoryTitle = categoryTitle
                    categoryTitle = ""
                    self.requestedCategory = nil
                }
            }
        }
        /// Delete Alert
        .alert("Are you sure to delete \(categoryTitle) category?", isPresented: $deleteRequest) {
            Button("Cancel", role: .cancel) {
                categoryTitle = ""
                requestedCategory = nil
            }
            
            Button("Delete", role: .destructive) {
                if let requestedCategory {
                    context.delete(requestedCategory)
                    categoryTitle = ""
                    self.requestedCategory = nil
                }
            }
        }
        /// Tool Bar Items
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                HStack(spacing: 10) {
                    Menu {
                                    Button(action: {
                                        // Action for first button
                                        let note = Note(content: "",
                                                        titleText: "",
                                                        timeValue: Date().timeIntervalSince1970,
                                                        type: NoteType(typeValue: "classic")
                                                        )
                                        context.insert(note)
                                    }) {
                                        Label("Create classic note", systemImage: "1.circle")
                                    }
                                    Button(action: {
                                        // Action for second button
                                        let note = Note(
                                                        titleText: "",
                                                        timeValue: Date().timeIntervalSince1970,
                                                        cardNumber: "",
                                                        cardName: "",
                                                        cardDate: "",
                                                        cardCvv: "",
                                                        cardPin: "",
                                                        type: NoteType(typeValue: "card")
                                                        )
                                        context.insert(note)
                                    }) {
                                        Label("Save bank card", systemImage: "2.circle")
                                    }
                                    Button(action: {
                                        // Action for third button
                                        let note = Note(
                                            titleText: "",
                                            timeValue: Date().timeIntervalSince1970,
                                            password: "",
                                            login: "",
                                            website: "",
                                            type: NoteType(typeValue: "password")
                                        )
                                        context.insert(note)
                                    }) {
                                        Label("Save password", systemImage: "3.circle")
                                    }
                                }
                label: {
                    Label("Menu Button", systemImage: "plus.circle")
                }
                .menuIndicator(.hidden)
    


                    Button("", systemImage: isDark ? "sun.min" : "moon") {
                        /// Dark - Light Mode
                        isDark.toggle()
                    }
                    .contentTransition(.symbolEffect(.replace))
                }
            }
        }
        .preferredColorScheme(isDark ? .dark : .light)

    }
}

        




