//
//  ContentView.swift
//  iExpense
//
//  Created by Anthony Candelino on 2024-07-01.
//

import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var settings = Settings()
    @State private var selectedExpenseType = "Personal"
    let expenseTypes = ["Personal", "Business"]
    let currencyOptions = ["USD", "CAD", "EUR", "GBP", "JPY"]
    
    var body: some View {
        NavigationStack {
            Picker("Expense Types", selection: $selectedExpenseType) {
                ForEach(expenseTypes, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            List {
                ForEach(expenses.items.filter({ item in item.type == selectedExpenseType })) { item in
                    ExpenseRow(name: item.name, type: item.type, amount: item.amount, settings: settings)
                }.onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                ToolbarItem() {
                    Picker(settings.currencyCode, selection: $settings.currencyCode) {
                        ForEach(settings.availableCurrencies, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(DefaultPickerStyle())
                }
                ToolbarItem(placement: .confirmationAction) {
                    NavigationLink(destination: AddView(expenses: expenses, settings: settings)) {
                        Image(systemName: "plus")
                    }
                    
                }
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        let currentList = expenses.items.filter({ item in item.type == selectedExpenseType })
        if let indexToDelete = offsets.first {
            let itemToDelete = currentList[indexToDelete]
            let itemId = itemToDelete.id
            expenses.items.removeAll(where: {$0.id == itemId})
        }
    }
}

#Preview {
    ContentView()
}
