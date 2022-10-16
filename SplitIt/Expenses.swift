//
//  Expenses.swift
//  SplitIt
//
//  Created by Matěj Mauler on 15.10.2022.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    var mine: [ExpenseItem] {
        items.filter { $0.iPaid == true }
    }
    
    var friends: [ExpenseItem] {
        items.filter { $0.iPaid == false }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
        
    }
}
