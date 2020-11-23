//
//  FishTableViewController.swift
//  P1
//
//  Created by BRANDON BURR on 11/22/20.
//  Copyright © 2020 BRANDON BURR. All rights reserved.
//

import UIKit
import CoreData
class FishTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var results:[FishCaught] = []
    
    @IBOutlet weak var tableView: UITableView!
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {


          return results.count

      }

      // TODO: Make sure this fires when the other VC is dismissed
      override func viewDidAppear(_ animated: Bool) {
          let fetchRequest:NSFetchRequest = FishCaught.fetchRequest()

          do{
              results = try (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext.fetch(fetchRequest) as! [FishCaught]
              tableView.reloadData()
          }
          catch{
              print("error!")
          }

      }
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "FishEntryCell")

          let currentSpot = results[indexPath.row]
        cell?.textLabel?.text = currentSpot.flyName

          return cell!
      }

      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          tableView.deselectRow(at: indexPath, animated: false)
      }

      override func viewDidLoad() {
          super.viewDidLoad()
          // Do any additional setup after loading the view.
      }

    @IBAction func addSpotFTapped(_ sender: Any) {
        let addSpotViewController = storyboard?.instantiateViewController(identifier: "AddSpotViewController")
               present(addSpotViewController!, animated: true, completion: nil)
    }
    
   
}
