//
//  main.swift
//  BattleRoyal
//
//  Created by etudiant on 27/10/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import Foundation


func updatePlayers (players: [Character]) -> [Character] {
    return players.filter { $0.health > 0 }
}

// players initialization
let noob = Character(name: "kékédu93")
let steve = Character(name: "Steve", weapon: Sword(name: "Dard", height: 50.0, width: 5.0, weight: 5.0, price: 70.0, year: 50))
let roiArthur = Character(name: "roi Arthur", weapon: Excalibur())
let froster = Character(name: "Froster", weapon: Gun(name: "Diplomatie", height: 7.0, width: 2.0, weight: 5.0, price: 1000.0, bullets: 10))
var players = [noob, steve, roiArthur, froster]

print("La bataille commence !")
var i = 1
repeat {
    print("\nTOUR \(i)")
    i += 1
    players.forEach({ charac in
        if charac.health > 0 {
            charac.attack(group: players)
        }
        players = updatePlayers(players: players)
    })
} while (players.count > 1)

print("\nEt le gagnant est \(players[0].name) !")

