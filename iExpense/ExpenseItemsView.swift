//
//  ExpenseItemsView.swift
//  iExpense
//
//  Created by Anthony Candelino on 2024-09-06.
//

import SwiftData
import SwiftUI

struct ExpenseItemsView: View {
    @Environment(\.modelContext) var modelContext
    var selectedExpenseType: String
    @Query var expenses: [ExpenseItem]
    
    var body: some View {
        List {
            ForEach(expenses) { expense in
                ExpenseRow(expense: expense)
            }.onDelete(perform: removeItem)
        }
    }
    
    func removeItem(at offsets: IndexSet) {
        for index in offsets {
            let expenseItem = expenses[index]
            modelContext.delete(expenseItem)
        }
    }
    
    init(selectedExpenseType: String, sortOrder: [SortDescriptor<ExpenseItem>]) {
        self.selectedExpenseType = selectedExpenseType
        _expenses = Query(filter: #Predicate<ExpenseItem> { expense in
                expense.type == selectedExpenseType || selectedExpenseType == "All"
        }, sort: sortOrder)
    }
}

#Preview {
    ExpenseItemsView(selectedExpenseType: "Personal", sortOrder: [SortDescriptor(\ExpenseItem.name)])
}
