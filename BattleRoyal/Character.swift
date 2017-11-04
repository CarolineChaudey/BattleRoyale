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
    var health = 100
    var hitChance: Int
    var pareChance: Int
    var weapon: IWeapon?
    
    init(name: String, weapon: IWeapon? = nil) {
        self.name = name
        self.weapon = weapon
        self.hitChance = Int(arc4random_uniform(21) + 50)
        self.pareChance = Int(arc4random_uniform(51))
    }
    
    func protect(damage: Int) {
        let filteredDamage = Int(Float(damage) * 0.55)
        print("\(name) subit \(filteredDamage) de dégâts.")
        self.health -= filteredDamage
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
            print("\(name) envoie \(damage!) points de dégât.")
            ennemy.receiveDamage(damage: damage!)
        } else {
            print("L'attaque de \(name) échoue.")
        }
        
    }
    
    func receiveDamage(damage: Int) {
        // a chance to pare
        if arc4random_uniform(101) < pareChance {
            print("\(name) réussi à partiellement bloquer le coup.")
            protect(damage: damage)
        } else {
            print("\(name) subit \(damage) de dégâts.")
            health -= damage
        }
        if health <= 0 {
            print("\(name) meurt.")
        }
    }
    
    func attack(group: [Character]) {
        let nbEnnemies = group.count
        let choosen = Int(arc4random_uniform(UInt32(nbEnnemies)))
        if group[choosen] === self {
            attack(group: group)
        } else {
            attack(ennemy: group[choosen])
        }
    }
    
}
