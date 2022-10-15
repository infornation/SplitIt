//
//  ExpensesView.swift
//  SplitIt
//
//  Created by Matěj Mauler on 15.10.2022.
//

import SwiftUI

struct ExpensesView: View {
    @ObservedObject var expenses: Expenses
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        HStack {
                            Image(systemName: "person.fill")
                            Text("\(item.numberOfPeople)")
                        }
                       Divider()

                        Text(item.splittedAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))


                    }
                    
                }.onDelete(perform: removeExpense)
            }.navigationTitle("Previous expenses")
        }
    }
    
    func removeExpense(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

//struct ExpensesView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExpensesView()
//    }
//}
