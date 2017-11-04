//
//  Excalibur.swift
//  BattleRoyal
//
//  Created by caroline on 04/11/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import Foundation

class Excalibur: Sword {
    
    init() {
        super.init(name: "Excalibur", height: 100.0, width: 7.0, weight: 5, price: 100000, year: 50, legendary: true)
    }
    
    override func bonus() -> Int {
        let bonus = Float(super.bonus()) * 1.3
        return Int(bonus)
    }
}
