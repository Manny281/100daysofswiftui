//
//  ContentView.swift
//  MathApp
//
//  Created by Manny Martinez on 1/30/23.
//

import SwiftUI

struct GlassFrame: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding(10)
            .padding(.vertical, 5)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        
    }
}

struct OrangeButtons: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color(red: 0.984, green: 0.337, blue: 0.027))
            .clipShape(Capsule())
            .foregroundColor(.white)
    }
}

struct SetUpText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .padding(.bottom, 20)
    }
}

struct ContentView: View {

    //game settings
    @State private var multiples = 2
    @State var score = 0
    @State var selectedRounds = 0
    
    @State private var setupIsShowing = true
    @State private var gameIsShowing = false
    @State private var buttonHidden =  true
    
    @State private var alertIsShowing = false
    @State private var alertTitle = ""
    
    let roundChoices = ["5 rounds", "10 rounds", "20 rounds"]
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 1, green: 0.745, blue: 0.043), location: 0),
                .init(color: Color(red: 1, green: 0, blue: 0.431), location: 1)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()

            VStack {
                Text("Multiplication")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .shadow(color: Color(red: 1, green: 0, blue: 0.431), radius: 40)
                
                
                
                Spacer()
                
                VStack {
                    Text("Select Multiplication Table")
                        .modifier(SetUpText())
                    Stepper("\(multiples)", value: $multiples, in: 2...12)
                } .padding(.horizontal, 10)
                    .modifier(GlassFrame())
                
                
                VStack {
                    Text("Select number of rounds")
                        .modifier(SetUpText())
                    HStack {
                        ForEach(0..<3) { num in
                            Button {
                                numOfRounds(num)
                                print("button pressed")
                            } label: {
                                Text(roundChoices[num])
                            }
                            .modifier(OrangeButtons())
                        }
                    }
                } .modifier(GlassFrame())
                
                VStack {
                    Button {
                        startPressed()

                    } label: {
                        Text("Start")
                            .padding(.horizontal, 20)
                            .font(.title2)
                    } .modifier(OrangeButtons())
                        .shadow(radius: 15.0)
                        .opacity(buttonHidden ? 0 : 1)
                        .sheet(isPresented: $gameIsShowing, onDismiss: dismissed) {
                            GameView(multiples: $multiples, score: $score, selectedRounds: $selectedRounds, gameIsShowing: $gameIsShowing)
                        }
                }
                
                Spacer()
            }
            .padding()
        }
        .alert(alertTitle, isPresented: $alertIsShowing) {
                  Button("Continue", action: errorStart)
        } message: {
                  Text("Please select number of rounds")
        }
    }
    
    func dismissed() {
        buttonHidden = true
        score = 0
    }
    
    func numOfRounds(_ num: Int){
        switch num {
        case 0:
            selectedRounds = 5
        case 1:
            selectedRounds = 10
        case 2:
            selectedRounds = 20
        default:
            selectedRounds = 0
        }
        
        if selectedRounds > 0 {
            buttonHidden = false
        } else {
            buttonHidden = true
        }
    }
    
    func startPressed() {
        if selectedRounds > 0 {
            setupIsShowing.toggle()
            gameIsShowing.toggle()
        } else {
            alertIsShowing.toggle()
            alertTitle = "Not So Fast!"
        }
    }
    
    func errorStart() {
    }
}

struct GameView: View {
    @Binding var multiples: Int
    @Binding var score: Int
    @Binding var selectedRounds: Int
    @Binding var gameIsShowing: Bool
    
    @State private var answer: Int?
    @State private var randomNum = Int.random(in: 0...12)
    @State private var round = 1
    @State private var textfield = true
    
    @State private var check = ""
    @State private var buttonHidden = true
    
    @State private var endAlertShowing = false
    @State private var endAlertTitle = ""
    
    @FocusState private var numIsFocused: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                RadialGradient(stops: [
                    .init(color: Color(red: 1, green: 0, blue: 0.431), location: 0),
                    .init(color: Color(red: 1, green: 0.745, blue: 0.043), location: 1)
                ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
                
                VStack {
                    
                    ZStack {
                        HStack {
                            Text("Round \(round) / \(selectedRounds)")
                            .padding([.leading])
                            .padding()
                            Spacer()
                        }
                        
                        HStack {
                            Spacer()
                            Text("Score : \(score)")
                            .padding([.trailing])
                            .padding()
                        }
                    } .foregroundColor(.white)
                        .font(.title3)
                    
                    Spacer()
                    
                    VStack {
                        Text("\(randomNum) X \(multiples) = ")
                            .padding(.vertical, 40)
                            .font(.system(size: 80))
                        
                        
                        TextField("Enter Your Answer", value: $answer, format: .number)
                            .keyboardType(.numberPad)
                            .focused($numIsFocused)
                            .multilineTextAlignment(.center)
                        
                        Text("\(check)")
                        
                        Button {
                            nextButton()
                        } label: {
                            Text("Next")
                                .padding(.horizontal, 40)
                                .font(.title2)
                        }.modifier(OrangeButtons())
                            .shadow(radius: 15.0)
                            .padding()
                            .opacity(buttonHidden ? 0 : 1)

                    }
                    .foregroundColor(.white)
                    .font(.system(size: 40))
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Button("Done") {
                                numIsFocused = false
                                checkAnswer()
                            }
                        }
                    }
                    
                    Spacer()
                    
                }
            }
        }
        .alert(endAlertTitle, isPresented: $endAlertShowing) {
                  Button("Exit", action: endGame)
        } message: {
                  Text("Final Score: \(score)/\(selectedRounds * 5).")
        }
    }
    
    func nextButton() {
        buttonHidden = true
        check = ""
        answer = nil
        next()
    }
    
    func endGame() {
        gameIsShowing = false
        selectedRounds = 0
        score = 0
    }
    
    func next() {
        randomNum = Int.random(in: 0...12)
    }
    
    func checkAnswer() {
        if answer == randomNum * multiples {
            score += 5
            check = "Correct!"
        } else {
            check = "Incorrect!"
            
            if score <= 0 {
                score = 0
            } else {
                score -= 2
            }
        }
        
        round += 1
        
        if round == selectedRounds {
            endAlertShowing = true
            endAlertTitle = "Game Over"
        }
        
        buttonHidden = false
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
