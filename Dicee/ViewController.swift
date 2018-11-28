//
//  ViewController.swift
//  Dicee
//
//  Created by Chen Wang on 10/24/17.
//  Copyright © 2017 Chen's studio. All rights reserved.
//

import UIKit
import AudioToolbox.AudioServices

class ViewController: UIViewController {
    
    var randomDiceIndex1 :Int = 0
    var randomDiceIndex2 :Int = 0
    var randomDiceIndex3 :Int = 0
    var count :Int = 0
    
    let diceArray = ["dice1","dice2","dice3","dice4","dice5","dice6"]
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    @IBOutlet weak var diceImageView3: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func rollButtonPressed(_ sender: UIButton) {
        count = count + 1
    }
    
    func updateDiceImages()
    {
        randomDiceIndex1 = Int(arc4random_uniform(6))
        randomDiceIndex2 = Int(arc4random_uniform(6))
        randomDiceIndex3 = Int(arc4random_uniform(6))
        
        
        diceImageView1.image = UIImage(named: diceArray[randomDiceIndex1])
        diceImageView2.image = UIImage(named: diceArray[randomDiceIndex2])
        diceImageView3.image = UIImage(named: diceArray[randomDiceIndex3])
    }
    
    func cheatWin()
    {
        randomDiceIndex1 = Int(arc4random_uniform(3))+3
        randomDiceIndex2 = Int(arc4random_uniform(3))+3
        randomDiceIndex3 = Int(arc4random_uniform(3))+3
        
        
        diceImageView1.image = UIImage(named: diceArray[randomDiceIndex1])
        diceImageView2.image = UIImage(named: diceArray[randomDiceIndex2])
        diceImageView3.image = UIImage(named: diceArray[randomDiceIndex3])
    }
    
    func cheatLose()
    {
        randomDiceIndex1 = Int(arc4random_uniform(5))
        randomDiceIndex2 = Int(arc4random_uniform(4))
        randomDiceIndex3 = Int(arc4random_uniform(3))
        
        
        diceImageView1.image = UIImage(named: diceArray[randomDiceIndex1])
        diceImageView2.image = UIImage(named: diceArray[randomDiceIndex2])
        diceImageView3.image = UIImage(named: diceArray[randomDiceIndex3])
    }
    
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        if(count == 0)
        {
            cheatLose();
        }else
        {
            cheatWin();
            count = 0;
        }
    }
    
}




















