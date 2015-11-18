//
//  ViewController.swift
//  RPG
//
//  Created by Gina De La Rosa on 11/12/15.
//  Copyright © 2015 Gina De La Rosa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var printLbl: UILabel!
    
    
    @IBOutlet weak var playerHpLbl: UILabel!
    
    
    @IBOutlet weak var enemyHpLbl: UILabel!
    
    
    @IBOutlet weak var enemyImage: UIImageView!
    
    @IBOutlet weak var chestButton: UIButton!
    
    var player: Player!
    var enemy: Enemy!
    var chestMessage: String?
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = Player(name: "DirtyLaundry21", hp: 110, attackPwr: 20)
        
        generateRandomEnemy()
        
        playerHpLbl.text = "\(player.hp) HP"
       
    }
    
    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            enemy = Kimara(startingHP: 50, attackPwr: 12)
        } else {
            enemy = DevilWizard(startingHP: 60, attackPwr: 15)
        }
        
        enemyImage.hidden = false
    }

    @IBAction func onChestTap(sender: AnyObject) {
        chestButton.hidden = true
        printLbl.text = chestMessage
       NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "generateRandomEnemy", userInfo: nil, repeats: false)
        
        
    }
    
    @IBAction func attackedTapped(sender: AnyObject) {
        
        if enemy.attemptAttack(player.attackPwr) {
            printLbl.text = "Attacked \(enemy.type) for \(player.attackPwr) HP"
            enemyHpLbl.text = "\(enemy.hp) HP"
        } else {
            printLbl.text = "Attacke was unsuccsseful!"
        }
        
        if let loot = enemy.dropLoot(){
            player.addItemToInventory(loot)
            chestMessage = "\(player.name) found \(loot)"
            chestButton.hidden = false
        }
        
        if !enemy.isAlive {
            enemyHpLbl.text = ""
            printLbl.text = "Killed \(enemy.type)"
            enemyImage.hidden = true
        }
    }

}

