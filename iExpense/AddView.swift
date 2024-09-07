//
//  AddView.swift
//  iExpense
//
//  Created by Anthony Candelino on 2024-07-03.
//

import SwiftData
import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [ExpenseItem]

    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    
    let types = ["Personal", "Business"]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: "CAD")).keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let item = ExpenseItem(name: name, type: type, amount: amount)
                        modelContext.insert(item)
                        dismiss()
                    }
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    AddView()
        .modelContainer(for: ExpenseItem.self)
}
