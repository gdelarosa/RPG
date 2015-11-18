//
//  DevilWizard.swift
//  RPG
//
//  Created by Gina De La Rosa on 11/12/15.
//  Copyright © 2015 Gina De La Rosa. All rights reserved.
//

import Foundation

class DevilWizard: Enemy {
    override var loot: [String] {
        return ["Magic Wand", "Dark Amulet", "Salted Pork"]
    }
    override var type: String {
        return "Devil Wizard"
    }
}
