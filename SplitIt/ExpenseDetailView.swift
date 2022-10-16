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
    @State private var didIPay = true
    @Binding var checkAmount: Double
    @Binding var expenseDetailOpened: Bool
    @Binding var numberOfPeople: Int
    @Binding var totalPerPersonAmount: Double
    let types = ["I paid", "I didn't pay"]
    
    var body: some View {
        Form{
            TextField("Name your expense...", text: $name)
            
            Toggle("I paid", isOn: $didIPay)
        
            TextField("Amount", value: $checkAmount, format: .localCurrency)
                .keyboardType(.decimalPad)
            
            Button("Save expense") {
                let expense = ExpenseItem(name: name, iPaid: didIPay, splittedAmount: totalPerPersonAmount, numberOfPeople: numberOfPeople)
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
