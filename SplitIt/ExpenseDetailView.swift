//
//  ExpenseDetailView.swift
//  SplitIt
//
//  Created by Matěj Mauler on 15.10.2022.
//

import SwiftUI

struct ExpenseDetailView: View {
    @ObservedObject var expenses: Expenses
    @State private var name = ""
    @State private var type = "Personal"
    @Binding var checkAmount: Double
    @Binding var expenseDetailOpened: Bool
    @Binding var numberOfPeople: Int
    @Binding var totalPerPersonAmount: Double
    let types = ["Business", "Personal"]
    
    var body: some View {
        Form{
            TextField("Name your expense...", text: $name)
            
            Picker("Type of expense", selection: $type) {
                ForEach(types, id: \.self) {
                    Text($0)
                }
                
            }
        
            TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                .keyboardType(.decimalPad)
            
            Button("Save expense") {
                let expense = ExpenseItem(name: name, type: type, splittedAmount: totalPerPersonAmount, numberOfPeople: numberOfPeople)
                expenses.items.append(expense)
                expenseDetailOpened = false
            }
            
        }
    }
}

struct ExpenseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseDetailView(expenses: Expenses(), checkAmount: .constant(50), expenseDetailOpened: .constant(true), numberOfPeople: .constant(3), totalPerPersonAmount: .constant(150))
    }
}
