//
//  ExpenseItem.swift
//  SplitIt
//
//  Created by Matěj Mauler on 15.10.2022.
//

import Foundation

struct ExpenseItem: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let iPaid: Bool
    let splittedAmount: Double
    let numberOfPeople: Int

}
