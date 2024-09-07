//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Anthony Candelino on 2024-07-03.
//

import Foundation
import SwiftData

@Model
class ExpenseItem {
    let name: String
    let type: String
    let amount: Double
    
    init(name: String, type: String, amount: Double) {
        self.name = name
        self.type = type
        self.amount = amount
    }
}
