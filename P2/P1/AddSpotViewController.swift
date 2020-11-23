//
//  AddSpotViewController.swift
//  P1
//
//  Created by BRANDON BURR on 11/22/20.
//  Copyright © 2020 BRANDON BURR. All rights reserved.
//

import UIKit
import CoreData

class AddSpotViewController: UIViewController {

    @IBOutlet weak var dateCaught: UIDatePicker!
   
    @IBOutlet weak var fishSize: UITextField!
    @IBOutlet weak var lineWeight: UITextField!
    @IBOutlet weak var flyName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitFishTapped(_ sender: Any) {
        let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext

           let newFish = FishCaught(context: managedObjectContext!)
        newFish.dateCaught = dateCaught.date
        newFish.flyName = flyName.text
        newFish.lineWeight = Int16(lineWeight.text!)!
        newFish.sizeOfFish = Int16(fishSize.text!)!
        dismiss(animated: true) {
               (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        }
    
    
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
