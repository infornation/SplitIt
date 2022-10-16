//
//  FormatStyle-LocalCurrency.swift
//  SplitIt
//
//  Created by Matěj Mauler on 16.10.2022.
//

import Foundation

extension FormatStyle where Self == FloatingPointFormatStyle<Double>.Currency {
    static var localCurrency: Self {
        .currency(code: Locale.current.currency?.identifier ?? "USD")
    }
}
