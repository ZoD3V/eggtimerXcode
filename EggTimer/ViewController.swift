//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var eggbl: UILabel!
    @IBOutlet weak var progessBar: UIProgressView!
    
    let eggTimes = ["Soft":5,"Medium":7,"Hard":12]
    var secondHitung = 60 //detik
    
    var timer = Timer()
    var totalTime = 0
    var secondTime = 0
    
    @IBAction func btnEgg(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        timer.invalidate()
        
        totalTime = eggTimes[hardness]!
        
        progessBar.progress = 0.0
        secondTime = 0
        eggbl.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(eggselector), userInfo: nil, repeats: true)
        
    }
    
    @objc func eggselector(){
        if secondTime < totalTime{
            secondTime += 1
            progessBar.progress = Float(secondTime) / Float(totalTime)
            
        }else{
            timer.invalidate()
            eggbl.text = "Hitung selesai"
        }
    }
        
}
