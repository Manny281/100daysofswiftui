//
//  ContentView.swift
//  Conversion
//
//  Created by Manny Martinez on 1/13/23.
//

import SwiftUI
    
struct ContentView: View {
    @State private var tempInput = 0.0
    @State private var defaultFormatIn = "Fahrenheit"
    @State private var defaultFormatOut = "Fahrenheit"
    
    let tempFormatIn = ["Celcius", "Fahrenheit", "Kelvin"]
    let tempFormatOut = ["Celcius", "Fahrenheit", "Kelvin"]
    
    @FocusState private var numIsFocused: Bool
    
    var tempOutput: Double {
        
        let convertedTemp = 0.0
        
        return convertedTemp
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Temperature", value: $tempInput, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($numIsFocused)
                        .multilineTextAlignment(.center)
                    
                    Picker("Format", selection: $defaultFormatIn) {
                        ForEach(tempFormatIn, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section {
                    Picker("Format", selection: $defaultFormatOut) {
                        ForEach(tempFormatOut, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                Text(tempOutput, format: .number)
                        .frame(maxWidth: .infinity, alignment: .center)
                        
                }
            }
            .navigationTitle("Converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        numIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
