//
//  ContentView.swift
//  iExpense
//
//  Created by Manny Martinez on 1/31/23.
//

import SwiftUI

struct StyleChallenge: ViewModifier {
    
    var amount: Double
    
    func body(content: Content) -> some View {
        var challenge = Color.black
        
        if amount <= 10.0 {
            challenge = Color.blue
        } else if amount > 10.0 && amount < 100.0 {
            challenge = Color.green
        } else {
            challenge = Color.red
        }
        
        return content
            .foregroundColor(challenge)
    }
}

extension View {
    func challengeStyle(_ amount: Double) -> some View {
        self.modifier(StyleChallenge(amount: amount))
    }
}

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(expenses.personalItems) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            
                            Spacer()
                            
                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        }
                        .challengeStyle(item.amount)
                    }
                    .onDelete(perform: removePersonalItems)
                }
                
                Section {
                    ForEach(expenses.businessItems) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            
                            Spacer()
                            
                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        }
                        .challengeStyle(item.amount)
                    }
                    .onDelete(perform: removeBusinessItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    func removePersonalItems(at offsets: IndexSet) {

      // look at each item we are trying to delete
      for offset in offsets {

        // look in the personalItems array and get that specific item we are trying to delete. Find it's corresponding match in the expenses.items array.
          if let index = expenses.items.firstIndex(where: {$0.id == expenses.personalItems[offset].id}) {

          // delete the item from the expenses.items array at the index you found its match
            expenses.items.remove(at: index)

          }
        }
      }
    func removeBusinessItems(at offsets: IndexSet) {

      // look at each item we are trying to delete
      for offset in offsets {

        // look in the personalItems array and get that specific item we are trying to delete. Find it's corresponding match in the expenses.items array.
          if let index = expenses.items.firstIndex(where: {$0.id == expenses.businessItems[offset].id}) {

          // delete the item from the expenses.items array at the index you found its match
            expenses.items.remove(at: index)

          }
        }
      }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
