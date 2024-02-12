//
//  Note.swift
//  Safe data
//
//  Created by Ilia Ilinskii on 12/02/2024.
//

import SwiftUI
import SwiftData

@Model
class Note {
    var content: String?
    var isFavourite: Bool = false
    var category: NoteCategory?
    
    init(content: String? = nil, category: NoteCategory? = nil) {
        self.content = content
        self.category = category
    }
}
