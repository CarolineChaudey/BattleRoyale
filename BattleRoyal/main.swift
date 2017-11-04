//
//  main.swift
//  BattleRoyal
//
//  Created by etudiant on 27/10/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import Foundation


func updatePlayers (players: [Character]) -> [Character] {
    return Array(players.drop(while: {
        if $0.health <= 0 {
            return true
        }
        return false
    }))
}

func attackOccures(attaquant: Character, victim: Character) {
    attaquant.attack(ennemy: victim)
    print("\(victim.name) a \(victim.health) PV")
}

let noob = Character(name: "kékédu93")
let steve = Character(name: "Steve", weapon: Sword(name: "Dard", height: 50.0, width: 5.0, weight: 5.0, price: 70.0, year: 100))
//let froster = Player(pseudo: "Steve", weapon: Gun(name: "Diplomatie", height: 10.0, width: 3.0, weight: 3.0, price: 100.0, bullets: 10))
var players = [noob, steve]

print("La bataille commence !")
repeat {
    attackOccures(attaquant: noob, victim: steve)
    attackOccures(attaquant: steve, victim: noob)
    players = updatePlayers(players: players)
} while (players.count > 1)

print("Et le gagnant est \(players[0].name) !")

