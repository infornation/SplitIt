//
//  ExpenseGroupView.swift
//  SplitIt
//
//  Created by Matěj Mauler on 16.10.2022.
//

import SwiftUI

struct ExpenseGroupView: View {
    let expenses: [ExpenseItem]
    let deleteItems: (IndexSet) -> Void
    
    var body: some View {
        List{
            ForEach(expenses) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                        }
                        
                        Spacer()
                        HStack {
                            Image(systemName: "person.fill")
                            Text("\(item.numberOfPeople)")
                        }
                       Divider()

                        Text(item.splittedAmount, format: .localCurrency)
                    }
            }.onDelete(perform: deleteItems)
        }.navigationTitle("Previous expenses")
    }
}
