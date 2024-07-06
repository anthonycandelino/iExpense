//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Anthony Candelino on 2024-07-03.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
