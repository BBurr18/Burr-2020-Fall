//
//  GuessANumber.swift
//  P1.1
//
//  Created by BRANDON BURR on 9/14/20.
//  Copyright © 2020 BRANDON BURR. All rights reserved.
//

import UIKit

class GuessANumber: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    var guessedNumber:Int = 0;
    @IBOutlet weak var numberBoard: UILabel!
    var resetNumberBoard:Bool = false;
    @IBOutlet weak var numberEntered: UITextField!
    
    @IBOutlet weak var submitButon: UIButton!
    @IBAction func submitGuess(_ sender: UIButton) {
        if resetNumberBoard == true{
             
            numberEntered.text = "";
            numberEntered.isHidden = false;
            numberBoard.text = "Guess a Number Between 1 - 10";
            resetNumberBoard = false;
            submitButon.setTitle("Hit Me",for: .normal);
        }else{
            if containsChar(numberEntered.text!) == true{
                numberBoard.text = "That's Not a Number...";
                resetNumberBoard = true;
                numberEntered.isHidden = true;
                submitButon.setTitle("Try Again",for:.normal);
            }else if numberEntered.text == "" {
                numberBoard.text = "Gotta Type Something In";
                resetNumberBoard = true;
                numberEntered.isHidden = true;
                submitButon.setTitle("Try Again",for:.normal);
            }else{
                guessedNumber = Int(numberEntered.text!)!;
                let randoNum = Int.random(in: 1..<10)
                if randoNum == guessedNumber{
                     numberBoard.text = "Congratulations! You got it right";
                }else if randoNum != guessedNumber{
                    numberBoard.text = "You suck, try again";
                }
                resetNumberBoard = true;
                numberEntered.isHidden = true;
                submitButon.setTitle("Try Again",for:.normal);
            }
            
        }
        
       
    }
    func containsChar(_ string:String) -> Bool {
        for character in string{
            if !character.isNumber{
                return true
            }
        }
        return false
    }
    

}
