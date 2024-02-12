//
//  NoteType.swift
//  Safe data
//
//  Created by Ilia Ilinskii on 06/03/2024.
//


import SwiftUI
import SwiftData

@Model
class NoteType {
    var typeValue: String
    /// Relationship
    @Relationship(deleteRule: .cascade, inverse: \Note.type)
    var notes: [Note]?
    
    init(typeValue: String) {
        self.typeValue = typeValue
    }
}
