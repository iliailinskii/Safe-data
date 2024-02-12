//
//  NoteCategory.swift
//  Safe data
//
//  Created by Ilia Ilinskii on 12/02/2024.
//

import SwiftUI
import SwiftData

@Model
class NoteCategory {
    var categoryTitle: String
    /// Relationship
    @Relationship(deleteRule: .cascade, inverse: \Note.category)
    var notes: [Note]?
    
    init(categoryTitle: String) {
        self.categoryTitle = categoryTitle
    }
}
