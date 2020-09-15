//
//  ViewController.swift
//  P1.1
//
//  Created by BRANDON BURR on 9/13/20.
//  Copyright © 2020 BRANDON BURR. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var screenText: UILabel!
    var numTyped:Double = 0;
    var numEntered:Double = 0;
    var calculating:Bool = false;
    var operatorSym = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func numbers(_ sender: UIButton){
        
        if calculating == true{
            screenText.text = String(sender.tag)
            numTyped = Double(screenText.text!)!
            calculating = false
        }else{
            
            screenText.text = screenText.text! + String(sender.tag)
            
            numTyped = Double(screenText.text!)!
        }
    }
    
    @IBAction func Operators(_ sender: UIButton) {
        if screenText.text != "" && sender.tag != 10 && sender.tag != 15
        {
            numEntered = Double(screenText.text!)!
            if sender.tag == 11{ //"/"
                screenText.text = "/";
            }else if sender.tag == 12{ //"x"
                screenText.text = "x";
            }else if sender.tag == 13{ // "-"
                screenText.text = "-";
            }else if sender.tag == 14{ // "+"
                screenText.text = "+";
            }
            operatorSym = sender.tag;
            calculating = true;
        }else if sender.tag == 15{
            if operatorSym == 11{
                screenText.text = String(Double(numEntered / numTyped))
            }else if operatorSym == 12{
                screenText.text = String(numEntered * numTyped)
            }else if operatorSym == 13{
                screenText.text = String(numEntered - numTyped)
            }else if operatorSym == 14{
                screenText.text = String(numEntered + numTyped)
            }
        }else if sender.tag == 10{
            screenText.text = "";
            numEntered = 0;
            numTyped = 0;
            operatorSym = 0;
        }
    }
}

