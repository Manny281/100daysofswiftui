//
//  Settings.swift
//  MathApp
//
//  Created by Manny Martinez on 2/12/23.
//

import Foundation

class GameSettings: ObservableObject {
    @Published var score = 0
    @Published var selectedRounds = 0
    
    @Published var multiples = 2
}
