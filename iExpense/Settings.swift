//
//  Settings.swift
//  iExpense
//
//  Created by Anthony Candelino on 2024-07-04.
//

import Foundation

@Observable
class Settings {
    var currencyCode: String {
        didSet {
            if let encoded = try? JSONEncoder().encode(currencyCode) {
                UserDefaults.standard.set(encoded, forKey: "currencyCode")
            }
        }
    }
    
    let availableCurrencies: [String] = ["USD", "EUR", "JPY", "GBP", "AUD", "CAD", "CHF", "CNY", "SEK", "NZD"]
    
    init() {
        if let savedCurrencyCode = UserDefaults.standard.data(forKey: "currencyCode") {
            if let decodedCurrencyCode = try? JSONDecoder().decode(String.self, from: savedCurrencyCode) {
                currencyCode = decodedCurrencyCode
                return
            } else if let localCurrencyCode = Locale.current.currency?.identifier {
                currencyCode = localCurrencyCode
                return
            }
        }
        
        currencyCode = "USD"
    }
    
}
