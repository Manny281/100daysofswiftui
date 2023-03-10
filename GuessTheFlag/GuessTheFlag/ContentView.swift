//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Manny Martinez on 1/15/23.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

struct ContentView: View {
    @State private var showingScore = false
    @State private var finalScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var counter = 1
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Monaco", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)

    @State private var animationAmount = 0.0
    @State private var fade = 1.0
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.4627, green: 0.8392, blue: 1.0), location: 0.10),
                .init(color: Color(red: 0.24, green: 0.56, blue: 1.0), location: 0.80)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            VStack {
                Spacer ()
                
                Text("Guess the Flag")
                    .modifier(Title())
                
                VStack(spacing: 32)  {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundColor(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImage(images: countries[number])
                        }
                        .rotation3DEffect(.degrees(number == self.correctAnswer ? animationAmount : 0), axis: (x: 0, y: 1, z: 0))
                        .opacity(number == correctAnswer ? 1 : fade)
                        .scaleEffect(number == correctAnswer ? 1 : fade)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundColor(Color(red: 0.5627, green: 0.9392, blue: 1.0))
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
        
        .alert(scoreTitle, isPresented: $finalScore) {
            Button("Reset", action: reset)
        } message: {
        Text("Your final score is \(score) / \(counter)")
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            withAnimation {
                animationAmount += 360
                fade = 0.25
            }
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
        }
        
        if counter == 8 {
            scoreTitle = "Game Over"
            
            finalScore = true
        } else {
            showingScore = true
            counter += 1
        }
    }
    
    func reset() {
        score = 0
        counter = 1
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        withAnimation {
            fade = 1
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        withAnimation {
            fade = 1
        }
    }
    
    struct FlagImage: View {
        var images = String()
        var body: some View {
            Image(images)
                .renderingMode(.original)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(color: .blue, radius: 10)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
