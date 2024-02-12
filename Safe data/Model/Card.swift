//
//  Card.swift
//  Safe data
//
//  Created by Ilia Ilinskii on 06/03/2024.
//

import SwiftUI
import SwiftData

@Model
class Card {
    var cardNumber: String?
    var cardName: String?
    var cardDate: String?
    var cardCvv: String?
    var cardPin: String?

    
    init(cardNumber: String? = nil,
         cardName: String? = nil,
         cardDate: String? = nil,
         cardCvv: String? = nil,
         cardPin: String? = nil) {
        self.cardNumber = cardNumber
        self.cardName = cardName
        self.cardDate = cardDate
        self.cardCvv = cardCvv
        self.cardPin = cardPin
    }
}

