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
    var titleText: String?
    var timeValue: Double
    var id: UUID
    var isFavourite: Bool = false
    var category: NoteCategory?
    var cardNumber: String?
    var cardName: String?
    var cardDate: String?
    var cardCvv: String?
    var cardPin: String?
    var password: String?
    var login: String?
    var website: String?
    var type: NoteType?
    
    init(content: String? = nil,
         titleText: String? = nil,
         id: UUID = UUID(),
         timeValue: Double,
         category: NoteCategory? = nil,
         cardNumber: String? = nil,
         cardName: String? = nil,
         cardDate: String? = nil,
         cardCvv: String? = nil,
         cardPin: String? = nil,
         password: String? = nil,
         login: String? = nil,
         website: String? = nil,
         type: NoteType? = nil) {
        self.content = content
        self.titleText = titleText
        self.timeValue = timeValue
        self.id = id
        self.category = category
        self.cardNumber = cardNumber
        self.cardName = cardName
        self.cardDate = cardDate
        self.cardCvv = cardCvv
        self.cardPin = cardPin
        self.password = password
        self.login = login
        self.website = website
        self.type = type
    }
}
