//
//  View-ExpenseStyling.swift
//  SplitIt
//
//  Created by Matěj Mauler on 16.10.2022.
//

import SwiftUI

extension View {
    func style(for item: ExpenseItem) -> some View {
        if item.splittedAmount < 10 {
            return self.font(.body)
        } else if item.splittedAmount < 100 {
            return self.font(.title3)
        } else {
            return self.font(.title)
        }
    }
}
