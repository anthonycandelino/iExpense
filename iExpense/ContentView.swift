//
//  ContentView.swift
//  iExpense
//
//  Created by Anthony Candelino on 2024-07-01.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var selectedExpenseType = "All"
    @State private var sortOrder = [
        SortDescriptor(\ExpenseItem.name),
        SortDescriptor(\ExpenseItem.amount)
    ]
    
    let expenseTypes = ["Personal", "Business"]
    
    var body: some View {
        NavigationStack {
            ExpenseItemsView(selectedExpenseType: selectedExpenseType, sortOrder: sortOrder)
            .navigationTitle("iExpense")
            .toolbar {
                ToolbarItem {
                    Menu("Show", systemImage: "line.3.horizontal.decrease.circle") {
                        Picker("Sort", selection: $selectedExpenseType) {
                            Text("Show All")
                                .tag("All")
                            Text("Show Personal Expenses")
                                .tag("Personal")
                            Text("Show Business Expenses")
                                .tag("Business")
                        }
                    }
                }
                ToolbarItem {
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Sort by Name")
                                .tag([
                                    SortDescriptor(\ExpenseItem.name),
                                    SortDescriptor(\ExpenseItem.amount)
                                ])
                            Text("Sort by Amount")
                                .tag([
                                    SortDescriptor(\ExpenseItem.amount),
                                    SortDescriptor(\ExpenseItem.name)
                                ])
                        }
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    NavigationLink(destination: AddView()) {
                        Image(systemName: "plus")
                    }
                    
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: ExpenseItem.self)
}
