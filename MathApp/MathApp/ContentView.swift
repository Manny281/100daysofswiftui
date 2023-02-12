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
    @StateObject var settings = GameSettings()
    
    @State private var setupIsShowing = true
    @State private var gameIsShowing = false
    
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
                    Stepper("\(settings.multiples)", value: $settings.multiples, in: 2...12)
                } .padding(.horizontal, 10)
                    .modifier(GlassFrame())
                
                
                VStack {
                    Text("Select number of rounds")
                        .modifier(SetUpText())
                    HStack {
                        ForEach(0..<3) { num in
                            Button {
                                print("button pressed")
                                gameIsShowing.toggle()
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
                        .sheet(isPresented: $gameIsShowing) {
                            GameView(settings: GameSettings())
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
    
    func startPressed() {
        if settings.selectedRounds < 0 {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
