//
//  Player.swift
//  RPG
//
//  Created by Gina De La Rosa on 11/12/15.
//  Copyright © 2015 Gina De La Rosa. All rights reserved.
//

import Foundation

class Player: Character {
    private var _name = "Player"
    
    var name: String {
        get {
            return _name
        }
    }
    
    private var _inventory = [String]()
    
    var inventory: [String] {
        return _inventory
    }
    
    func addItemToInventory(item: String) {
        _inventory.append(item)
    }
    convenience init(name: String, hp: Int, attackPwr: Int) {
        self.init(startingHP: hp, attackPwr: attackPwr)
        
        _name = name
    }
}