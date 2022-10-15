//
//  ExpenseItem.swift
//  SplitIt
//
//  Created by Matěj Mauler on 15.10.2022.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let splittedAmount: Double
    let numberOfPeople: Int
}
