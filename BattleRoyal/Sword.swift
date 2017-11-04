//
//  Sword.swift
//  BattleRoyal
//
//  Created by etudiant on 27/10/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import Foundation

class Sword: IWeapon {
    
    var name: String
    var height: Float
    var width: Float
    var weight: Float
    var price: Float
    var legendary: Bool
    var year: Int
    
    init(name: String, height: Float, width: Float, weight: Float, price: Float, year: Int, legendary: Bool = false) {
        self.name = name
        self.height = height
        self.width = width
        self.weight = weight
        self.price = price
        self.year = year
        self.legendary = legendary
    }
    
    func duration() -> Int {
        // Durée de vie de l’épée calculée par le poids multiplié par l’année le tout divisé par le prix.
        return Int((weight * Float(year)) / price)
    }
    
    func damage() -> Int {
        // Est la multiplication entre le poids la hauteur et la largeur. On ajoute le bonus sur cette valeur. Le tout est ensuite divisé par l’année. Si l’arme n’est pas légendaire ou que la durée de vie est inférieure à 10 ans alors une réduction de 10% doit être appliquée
        var damage = (weight * height * width + Float(bonus())) / Float(year)
        if (!legendary) || (duration() < 10) {
            damage *= 0.90
        }
        return Int(damage)
    }
    
    func bonus() -> Int {
        // Uniquement si l’arme est légendaire, le poids divisé par l’Année de l’épée
        return legendary ? Int(weight / Float(year)) : 0
    }
}
