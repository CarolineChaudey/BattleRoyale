//
//  IWeapon.swift
//  BattleRoyal
//
//  Created by caroline on 04/11/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import Foundation

protocol IWeapon {
    var name: String {get set}
    var weight: Float {get set}
    var height: Float {get set}
    var width: Float {get set}
    var price: Float {get set}
    
    func duration() -> Int
    func damage() -> Int
    func bonus() -> Int
}
