//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Manny Martinez on 1/21/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var showingFinalScore = false
    @State private var totalScore = 0
    @State private var round = 1
    
    @State private var choices = ["✊", "✋", "✌️"]
    @State private var winLose = Bool.random()
    @State private var computerMove = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                VStack {
                    Text("Rock Paper Scissors")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    Text("Round: \(round)")
                        .font(.title)
                }
                Spacer()
                
                VStack {
                    Text("Computer Chose:")
                        .font(.title)
                    Text(choices[computerMove])
                        .font(.system(size:200))
                }
                Spacer()
                
                VStack {
                    Text("Choose One")
                        .font(.largeTitle)
                    HStack {
                        ForEach (choices, id: \.self) {
                            Text($0)
                                .font(.system(size:90))
                        }
                    }
                   
                }
                Spacer()
                VStack {
                    Text("Score: \(totalScore)")
                        .font(.title)
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
