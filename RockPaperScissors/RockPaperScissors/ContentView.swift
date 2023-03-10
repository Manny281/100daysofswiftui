//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Manny Martinez on 1/21/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var ready = false
    @State private var showLose = false
    @State private var showDraw = false
    @State private var showWin = false
    @State private var showingFinalScore = false
    @State private var totalScore = 0
    @State private var round = 1
    @State private var messageTitle = ""
    
    @State private var user = ""
    @State private var cpu = ""
    
    @State private var choices = ["✊", "✋", "✌️"]
    @State private var computerMove = Int.random(in: 0...2)
    
    @State private var scale = 1.0
    @State private var cpuscale = 1.0
    @State private var angle = -90.0
    @State private var fade = 1.0
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(red: 0.4627, green: 0.8392, blue: 1.0), .blue] ), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                VStack {
                    Text("Rock Paper Scissors")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                    Text("Round: \(round)")
                        .font(.title)
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                VStack {
                    Text("Computer Chose:")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    Text(choices[computerMove])
                        .font(.system(size:200))
                        .scaleEffect(cpuscale)
                        .animation(.easeIn, value: cpuscale)
                        .rotationEffect(.degrees(angle))
                        .animation(.easeIn, value: angle)
                }
                
                Spacer()
                
                VStack {
                    Text("Choose One")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    HStack {
                        ForEach (0..<3) { number in
                            Button {
                                cpuMove()
                                WhenTapped(number)
                            } label: {
                                Text(choices[number])
                            }
                            .padding(.horizontal, 15)
                            .font(.system(size:90))
                            .shadow(color: .blue, radius: 7)
                            .scaleEffect(choices[number] == user ? scale : 1.0)
                            .animation(.easeIn, value: scale)
                            .opacity(choices[number] == user ? 1 : fade)
                            
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                
                VStack {
                    Text("Score: \(totalScore)")
                        .font(.title)
                        .foregroundColor(.white)
                }
            }
        }
        
        .alert(messageTitle, isPresented: $ready) {
            Button("Next Round", action: ClosedHand)
        } message: {
            Text("\(messageTitle)")
        }
        
        .alert(messageTitle, isPresented: $showingFinalScore) {
                    Button("Reset", action: reset)
                } message: {
                Text("Game Over : Your final score is \(totalScore) / \(round)")
                }
    }
        
    func cpuMove() {
        computerMove = Int.random(in: 0...2)
    }
    
    func ClosedHand() {
        computerMove = 0
        scale = 1.0
        cpuscale = 0.8
        angle = -90.0
        fade = 1.0
    }
    
    func reset() {
        ClosedHand()
        totalScore = 0
        round = 1
        fade = 1.0
    }
    
    func WhenTapped(_ number: Int) {
        user = choices[number]
        cpu = choices[computerMove]
        ready = true

        if cpu == user {
            messageTitle = "Draw"
        } else if cpu == "✌️" && user != "✊" {
            messageTitle = "You Lose"
        } else if cpu == "✊" && user != "✋" {
            messageTitle = "You Lose"
        } else if cpu == "✋" && user != "✌️"{
            messageTitle = "You Lose"
        } else {
            messageTitle = "You Win"
            totalScore += 1
            
        }
        
        round += 1
        
        if round == 8 {
            showingFinalScore = true
            ready = false
        } else {
            ready = true
        }
        
        if ready == true || showingFinalScore == true{
            scale += 0.4
            cpuscale += 0.4
            angle = 0
            fade = 0.25
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
