//
//  Gun.swift
//  BattleRoyal
//
//  Created by etudiant on 27/10/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import Foundation

class Gun : IWeapon {
    var name: String
    var height: Float
    var width: Float
    var weight: Float
    var price: Float
    var bullets: Int
    
    init(name: String, height: Float, width: Float, weight: Float, price: Float, bullets: Int = 0) {
        self.name = name
        self.height = height
        self.width = width
        self.weight = weight
        self.price = price
        self.bullets = bullets
    }
    
    func duration() -> Int {
        //Durée de vie de l’arme calculée par le prix divisé par le poids et le tout multiplié par les dégâts
        return Int((price / weight)) * damage()
    }
    
    func damage() -> Int {
        // Est le rapport entre le poids et la multiplication entre la hauteur et la largeur. Le bonus s’ajoute à cette valeur
        //print("Bonus du pistolet : \(bonus())")
        use()
        return Int(weight / (height * width)) + bonus()
    }
    
    func bonus() -> Int {
        // Correspond à une multiplication entre le nombre de balles et le poids, le tout divisé par le poids modulo le nombre de balles
        //return Int((Float(bullets) * weight) / Float((Int(weight) % bullets)))
        // risque de division par 0
        return Int((Float(bullets) * weight))
    }
    
    func use() -> Bool {
        if bullets > 0 {
            bullets -= 1
            return true
        }
        print("Plus de balles !")
        return false
    }
}
