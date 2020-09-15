//
//  CountDown.swift
//  P1.1
//
//  Created by BRANDON BURR on 9/13/20.
//  Copyright © 2020 BRANDON BURR. All rights reserved.
//

import UIKit

class CountDown: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }
 
    var numberCurr:Int = 0;
    var cDown:Bool = false;
    
    
    @IBOutlet weak var timeLeft: UILabel!
    
    @IBOutlet weak var secretText: UILabel!
    @IBOutlet weak var slideyObject: UISlider!
    @IBAction func slidey(_ sender: UISlider) {
        secretText.text = "";
        if slideyObject.value == 1{
            secretText.text = "Insert Secret Message Here:";
        }
    }
    
    @IBAction func countdown(_ sender: UIButton) {
        numberCurr = 60;
        if sender.tag == 0{
            timeLeft.text = String(numberCurr);
            Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)

        }
    }
    
   @objc func updateCounter() { 
        numberCurr -= 1;
        timeLeft.text = String(numberCurr);
        if numberCurr <= 0{
            cDown = false;
            timeLeft.text = "0";
        }
        
    }
    

    

}
