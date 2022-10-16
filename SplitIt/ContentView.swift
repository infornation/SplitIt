//
//  ContentView.swift
//  SplitIt
//
//  Created by Matěj Mauler on 17.09.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 1
    @State private var tipPercentage = 10
    @FocusState private var amountIsFocused: Bool
    @State private var tipCustom = false
    @StateObject var expenses = Expenses()
    @State private var expenseDetailOpened = false
    @State private var totalPerPersonAmount = 0.0

    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople)
        let percentageMultiplier = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * percentageMultiplier
        
        let grandTotal = (checkAmount + tipValue) / peopleCount
        
        return grandTotal
    }
    var totalForEveryone: Double {
        let tipTotal = Double(tipPercentage)*checkAmount/100
        let total = checkAmount+tipTotal
        return total
    }
    
    let tipPercenteges = [10, 15, 20, 25, 0]
    
    
    var body: some View {
        NavigationView{
            Form{
                Section {
                    TextField("Amount", value: $checkAmount, format: .localCurrency)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                        
                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach(0..<10){
                            if $0 == 0 {
                                
                            } else {
                                Text("\($0) people")
                            }
                            
                        }
                    }
                }
                
                Section("How much tip do you want to leave? "){
                    if tipCustom {
                        Picker("Tip percentage", selection: $tipPercentage){
                            ForEach(0..<101){
                                Text($0, format: .percent)
                                
                            }
                        }
                        .pickerStyle(.wheel)
                        VStack {
                            Button("Back"){
                                tipCustom = false
                            }
                        }
                    } else {
                        Picker("Tip percentage", selection: $tipPercentage){
                            ForEach(tipPercenteges, id: \.self){
                                Text($0, format: .percent)
                                
                            }
                        }
                        .pickerStyle(.segmented)
                        VStack{
                            Button("Custom"){
                                tipCustom = true
                            }
                        }
                        
                    }
                    
                    
                }
                Section("Total amount"){
                    Text(totalForEveryone, format:
                            .localCurrency)
                    .foregroundColor(tipPercentage == 0 ? .red : .black)
                }
                Section ("Amount per person"){
                    Text(totalPerPerson, format: .localCurrency)
                }
                
                Button("Save expense") {
                    totalPerPersonAmount = totalPerPerson
                    expenseDetailOpened = true
                }.sheet(isPresented: $expenseDetailOpened) {
                    ExpenseDetailView(expenses: expenses, checkAmount: $checkAmount, expenseDetailOpened: $expenseDetailOpened, numberOfPeople: $numberOfPeople, totalPerPersonAmount: $totalPerPersonAmount)
                }
                NavigationLink("Expense history", destination: ExpensesView(expenses: self.expenses))
                
            }
            .navigationTitle("Split.It")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItemGroup(placement: .keyboard){
                    Spacer()
                    
                    Button("Done"){
                        amountIsFocused = false
                    }
                }
            }
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
