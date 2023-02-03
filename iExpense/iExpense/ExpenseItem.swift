//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Manny Martinez on 2/2/23.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

