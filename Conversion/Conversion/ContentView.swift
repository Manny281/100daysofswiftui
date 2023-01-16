//
//  ContentView.swift
//  Conversion
//
//  Created by Manny Martinez on 1/13/23.
//

import SwiftUI
    
struct ContentView: View {
    @State private var tempInput = 0.0
    //@State private var selectIn = 0
    //@State private var selectOut = 1
    @State private var selectIn = "Fahrenheit"
    @State private var selectOut = "Fahrenheit"
    
    let tempFormats = ["Celsius", "Fahrenheit", "Kelvin"]
    
    @FocusState private var numIsFocused: Bool
    
    private var convertedTemp : Double {
        var result = tempInput
        
        switch(selectIn) {
        case "Celsius" : break
        case "Fahrenheit" : result = (result - 32) * 5 / 9
        case "Kelvin" : result = result - 273.15
        default : break
        }
        
        switch(selectOut) {
        case "Celsius" : break
        case "Fahrenheit" : result = result * (9 / 5) + 32
        case "Kelvin" : result = result + 273.15
        default : break
        }
        
        return result
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Temperature", value: $tempInput, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($numIsFocused)
                        .multilineTextAlignment(.center)
                } header: {
                    Text("Enter Temperature")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                
                Section {
                    Picker("Format", selection: $selectIn) {
                        ForEach(tempFormats, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Units From")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                
                Section {
                    Picker("Format", selection: $selectOut) {
                        ForEach(tempFormats, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Units To")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                
                Section {
                    Text("\(tempInput, specifier: "%.2f") \(selectIn) : \(convertedTemp, specifier: "%.2f") \(selectOut)")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                }
            }
            .navigationTitle("Temperature Converter")
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
