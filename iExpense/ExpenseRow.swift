//
//  ExpenseRow.swift
//  iExpense
//
//  Created by Anthony Candelino on 2024-07-04.
//

import SwiftUI

struct ExpenseRow: View {
    var name: String
    var type: String
    var amount: Double
    var settings: Settings
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(name)
                    .font(.headline)
                Text(type).padding(.top, 3)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text(amount, format: .currency(code: settings.currencyCode))
                Text(getExpenseLabel()).font(.subheadline)
                    .padding(.vertical, 2)
                    .padding(.horizontal, 5)
                    .background(getExpenseLabelColor().clipShape(RoundedRectangle(cornerRadius: 5)))    
            }
        }
    }
    
    func getExpenseLabel() -> String {
        switch amount {
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
        switch amount {
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
    ExpenseRow(name: "Mock Expense", type: "Personal", amount: 12.50, settings: Settings())
}
