//
//  HomeViewController.swift
//  P1
//
//  Created by BRANDON BURR on 11/22/20.
//  Copyright © 2020 BRANDON BURR. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

   
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
    
    @IBAction func fishLocationTapped(_ sender: Any) {
        let viewController = storyboard?.instantiateViewController(identifier: "ViewController")
        present(viewController!, animated: true, completion: nil)
    }
    
    @IBAction func fishTapped(_ sender: Any) {
        let fishTableViewController = storyboard?.instantiateViewController(identifier: "FishTableViewController")
        present(fishTableViewController!, animated: true, completion: nil)
    }
    
    @IBAction func knotsTapped(_ sender: Any) {
        let knotsViewController = storyboard?.instantiateViewController(identifier: "KnotsViewController")
        present(knotsViewController!, animated: true, completion: nil)
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
