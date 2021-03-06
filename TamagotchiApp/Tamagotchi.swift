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
    @Published var activity: String
    @Published var remainingTime: Int
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    init(name: String) {
        self.hunger = 10
        self.isHungry = false
        self.age = 0
        self.isTired = false
        self.energy = 50
        self.alive = true
        self.weight = Int.random(in: 10...100)
        self.name = name
        self.activity = "Not Busy"
        self.remainingTime = 60
    }
    
    func getDetails() -> String {
        return """
            Hunger: \(hunger)
            age: \(age)
            Energy: \(energy)
            Weight: \(weight)
            Activity: \(activity)
            
            """
    }
    
    func feed() {
        if hunger <= 5 || energy <= 20 || weight <= 20 {
            activity = "EATING"
            hunger += 1
            weight += 2
            energy += 5
        }
    }
    
    func kill() -> Bool {
        activity = "DYING"
        alive = false
        name = "LMAO DEAD"
        return alive
        
    }
    
    func sleep() {
        if isTired == true {
            isTired = false
        }
    }
    
    func timing() {
        if remainingTime == 0 {
            kill()
        } else {
            remainingTime -= 1
        }
    }
    
    VSatck(alignment: .leading, spacing: 20) {
        Text("\(remainingTime)")
        .onReceive(timer, perform: { _ in
            if self.remainingTime > 0{
                self.remainingTime -= 1
            }
        })
    }

    
}


