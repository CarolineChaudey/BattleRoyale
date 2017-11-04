//
//  Player.swift
//  BattleRoyal
//
//  Created by etudiant on 27/10/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import Foundation

class Character {
    var name: String
    var health = 25000
    var hitChance: Int
    var weapon: IWeapon?
    
    init(name: String, weapon: IWeapon? = nil) {
        self.name = name
        self.weapon = weapon
        self.hitChance = Int(arc4random_uniform(21) + 50)
    }
    
    func protect(damage: Int) {
        self.health -= Int(Float(damage) * 0.55)
    }
    
    func attack(ennemy: Character) {
        print("\(name) attaque \(ennemy.name).")
        let success = (arc4random_uniform(101) < hitChance)
        if success {
            var damage = weapon?.damage()
            if damage == nil {
                print("\(name) n'a pas d'armes.")
                damage = 10
            }
            damage = Int(Float(damage!) * 1.13)
            ennemy.receiveDamage(damage: damage!)
            print("\(name) envoie \(damage) points de dégât.")
        } else {
            print("L'attaque de \(name) échoue.")
        }
        
    }
    
    func receiveDamage(damage: Int) {
        health -= damage
        if health <= 0 {
            print("\(name) dies.")
        }
    }
    
}
