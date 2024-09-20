//
//  ExpenseRow.swift
//  iExpense
//
//  Created by Anthony Candelino on 2024-07-04.
//

import SwiftData
import SwiftUI

struct ExpenseRow: View {
    var expense: ExpenseItem
    
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(expense.name)
                    .font(.headline)
                Text(expense.type).padding(.top, 3)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text(expense.amount, format: .currency(code: "CAD"))
                Text(getExpenseLabel()).font(.subheadline)
                    .padding(.vertical, 2)
                    .padding(.horizontal, 5)
                    .background(getExpenseLabelColor().clipShape(RoundedRectangle(cornerRadius: 5)))    
            }
        }
        .accessibilityLabel("\(expense.name) \(expense.amount.formatted(.currency(code: "CAD")))")
        .accessibilityHint("\(expense.type) Expense")
    }
    
    func getExpenseLabel() -> String {
        switch expense.amount {
        case ..<10.01:
            return "Small"
        case ..<100.01:
            return "Medium"
        case 100.00...:
            return "Large"

        default:
            return "Other"
        }
    }
    
    func getExpenseLabelColor() -> Color {
        switch expense.amount {
        case ..<10.01:
            return Color(red: 0.83, green: 0.90, blue: 0.84)
        case ..<100.01:
            return Color(red: 0.65, green: 0.84, blue: 0.77)
        case 100.00...:
            return Color(red: 0.55, green: 0.76, blue: 0.68)

        default:
            return Color(red: 0.88, green: 0.95, blue: 0.89)
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true) // Store the container in memory since we don't actually want to save the preview data
        let container = try ModelContainer(for: ExpenseItem.self, configurations: config)
        let expense = ExpenseItem(name: "EXPENSE ITEM NAME", type: "Personal", amount: 1000.00)
        
        return ExpenseRow(expense: expense)
            .modelContainer(for: ExpenseItem.self)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
