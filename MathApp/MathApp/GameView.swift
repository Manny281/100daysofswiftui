//
//  GameView.swift
//  MathApp
//
//  Created by Manny Martinez on 2/12/23.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var settings: GameSettings
    
    @State private var answer = Int()
    @State private var randomNum = Int.random(in: 0...12)
    @State private var round = 1
    
    @FocusState private var numIsFocused: Bool
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 1, green: 0, blue: 0.431), location: 0),
                .init(color: Color(red: 1, green: 0.745, blue: 0.043), location: 1)
            ], center: .top, startRadius: 200, endRadius: 700)
        .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    Text("Round \(round) / \(settings.selectedRounds)")
                } .foregroundColor(.white)
        
                Spacer()
                
                VStack {
                    Text("\(randomNum) X \(settings.multiples) = ")
                        .padding(.vertical, 40)
                        .font(.system(size: 80))
                    TextField("Enter Your Answer", value: $answer, format: .number)
                        .keyboardType(.numberPad)
                        .focused($numIsFocused)
                        .multilineTextAlignment(.center)
                        .toolbar {
                            ToolbarItem(placement: .keyboard) {
                                Button("Done") {
                                    numIsFocused = false
                                }
                            }
                        }
                }
                    .foregroundColor(.white)
                    .font(.system(size: 40))
                Spacer()
                   
            } 
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(settings: GameSettings())
        .environmentObject(GameSettings())
    }
}
