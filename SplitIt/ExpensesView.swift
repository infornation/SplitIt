//
//  ExpensesView.swift
//  SplitIt
//
//  Created by Matěj Mauler on 15.10.2022.
//

import SwiftUI

struct ExpensesView: View {
    @ObservedObject var expenses: Expenses
    @State private var iPaid = true
    
    var body: some View {
        NavigationStack{
            Picker(selection: $iPaid, label: Text("Who paid the epxense?")) {
                Text("I paid")
                    .tag(true)
                    .padding()
                Text("Friend paid")
                    .tag(false)
                    .padding()
            }.pickerStyle(.segmented)
            
            if iPaid {
                ExpenseGroupView(expenses: expenses.mine, deleteItems: removeMineExpense)
            } else {
                ExpenseGroupView(expenses: expenses.friends, deleteItems: removeFriendsExpense)
            }
            
        }
    }
    
    func removeExpense(at offsets: IndexSet, in inputArray: [ExpenseItem]) {
        var objectsToDelete = IndexSet()
        
        for offset in offsets {
            let item = inputArray[offset]
            
            if let index = expenses.items.firstIndex(of: item) {
                objectsToDelete.insert(index)
            }
        }
        
        expenses.items.remove(atOffsets: objectsToDelete)
    }
    
    func removeMineExpense(at offsets: IndexSet) {
        removeExpense(at: offsets, in: expenses.mine)
    }
    
    func removeFriendsExpense(at offsets: IndexSet) {
        removeExpense(at: offsets, in: expenses.friends)
    }
}

//struct ExpensesView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExpensesView()
//    }
//}
