//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Anthony Candelino on 2024-07-01.
//

import SwiftUI

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}
