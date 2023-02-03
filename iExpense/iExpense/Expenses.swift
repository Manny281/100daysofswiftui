//
//  Expenses.swift
//  iExpense
//
//  Created by Manny Martinez on 2/2/23.
//

import Foundation

class Expenses: ObservableObject {
    //store an array of ExpenseItems inside a single object
    var personalItems : [ExpenseItem] {
            get { items.filter { $0.type == "Personal" } }
            set { }
        }

    var businessItems: [ExpenseItem] {
        get { items.filter { $0.type == "Business" } }
    }
    
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
            
        }
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
