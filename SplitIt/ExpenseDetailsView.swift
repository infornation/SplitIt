//
//  ExpenseDetailsView.swift
//  SplitIt
//
//  Created by Matěj Mauler on 15.10.2022.
//

import SwiftUI

struct ExpenseDetailsView: View {
    @State private var name = ""
    @State private var type = "Personal"
    @Binding var checkAmount: Double
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Name your expense...", text: $name)
                
                Picker("Type of expense", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
            
                TextField("Amount", value: $checkAmount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
                
            }
        }
    }
}

struct ExpenseDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseDetailsView()
    }
}
