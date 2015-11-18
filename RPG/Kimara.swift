//
//  Kimara.swift
//  RPG
//
//  Created by Gina De La Rosa on 11/12/15.
//  Copyright © 2015 Gina De La Rosa. All rights reserved.
//

import Foundation

class Kimara: Enemy {
    
    let IMMUNE_MAX = 15
    
    override var loot: [String] {
        return ["Tough Hide", "Venom", "Rare Trident"]
    }
    
    override var type: String {
        return "Kimara"
    
    }
    
    override func attemptAttack(attackPwr: Int) -> Bool {
        if attackPwr >= IMMUNE_MAX {
            return super.attemptAttack(attackPwr)
        } else {
            return false
        }
    }
}