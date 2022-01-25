//
//  Tamagotchi.swift
//  TamagotchiApp
//
//  Created by James, Killian (NA) on 25/01/2022.
//

import Foundation

class BaseTamagotchi: ObservableObject {
    @Published var hunger: Int
    @Published var isHungry: Bool
    @Published var age: Int
    @Published var isTired: Bool
    @Published var energy: Int
    @Published var alive: Bool
    var name: String
    @Published var weight: Int
    
    init(name: String) {
        self.hunger = 10
        self.isHungry = false
        self.age = 0
        self.isTired = false
        self.energy = 50
        self.alive = true
        self.weight = Int.random(in: 10...100)
        self.name = name
        
    }
    
    func getDetails() -> String {
        return """
            Hunger: \(hunger)
            age: \(age)
            Energy: \(energy)
            
            """
    }
    
    func feed() {
        if hunger <= 5 || energy <= 20 || weight <= 20 {
            hunger += 1
            weight += 2
            energy += 5
        }
    }
    
    func kill() -> Bool {
        alive = false
        return alive
    }
}
