//
//  main.swift
//  BattleRoyal
//
//  Created by etudiant on 27/10/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import Foundation


func updatePlayers (players: [Player]) -> [Player] {
    return Array(players.drop(while: {
        if $0.life <= 0 {
            return true
        }
        return false
    }))
}

func attackOccures(attaquant: Player, victim: Player) {
    attaquant.attack(ennemy: victim)
    print("\(victim.pseudo) a \(victim.life) PV")
}

let noob = Player(pseudo: "kékédu93")
let steve = Player(pseudo: "Steve", weapon: Sword(name: "Dard", height: 50.0, width: 5.0, weight: 5.0, price: 70.0, year: 100))
let froster = Player(pseudo: "Steve", weapon: Gun(name: "Diplomatie", height: 10.0, width: 3.0, weight: 3.0, price: 100.0, bullets: 10))
var players = [noob, steve, froster]

print("La bataille commence !")
repeat {
    attackOccures(attaquant: noob, victim: steve)
    attackOccures(attaquant: steve, victim: noob)
    players = updatePlayers(players: players)
} while (players.count > 1)

print("Et le gagnant est \(players[0].pseudo) !")
