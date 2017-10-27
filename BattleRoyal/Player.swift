//
//  Player.swift
//  BattleRoyal
//
//  Created by etudiant on 27/10/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import Foundation

class Player {
    var pseudo: String
    var life = 100
    var weapon: IWeapon?
    
    init(pseudo: String, weapon: IWeapon? = nil) {
        self.pseudo = pseudo
        self.weapon = weapon
    }
    
    func attack(ennemy: Player) {
        if weapon != nil {
            print("\(pseudo) attaque \(ennemy.pseudo) avec \(weapon?.name).")
            if let use = weapon?.use(), use == true {
                let deal = weapon?.damage()
                ennemy.receiveDamage(damage: deal!)
            } else {
                print("\(pseudo) n'arrive pas à utiliser son arme !")
            }
            
        } else {
            print("\(pseudo) attaque \(ennemy.pseudo) avec ses pauvres petits poings.")
            ennemy.receiveDamage(damage: 1)
        }
    }
    
    func receiveDamage(damage: Int) {
        life -= damage
        if life <= 0 {
            print("\(pseudo) dies.")
        }
    }
    
}
