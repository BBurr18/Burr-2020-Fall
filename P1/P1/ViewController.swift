//
//  ViewController.swift
//  P1
//
//  Created by BRANDON BURR on 10/29/20.
//  Copyright © 2020 BRANDON BURR. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate  {
    
    let imagePickerController = UIImagePickerController()
    let locationManager = CLLocationManager()
   
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var mapView: MKMapView!
    
    var lastSelectedIndex: NSIndexPath?
    var dataArray:Array<UIImage> = []
    //var dataarray = [UIImage?](count:10,repeatedValue:nil)
    var count = 0
    var temp = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        locationManager.requestWhenInUseAuthorization()
        locationManager.distanceFilter = 40
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        mapView.showsUserLocation = true
        let chuck = CLLocationCoordinate2D(latitude: 43.6186, longitude: 116.2592)
        let geofenceRegion = CLCircularRegion(center: chuck, radius: 50, identifier: "Boise")
    }
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("Entered")
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let currentLocation = locations.first{
            //print(currentLocation.coordinate)
            let mapRegion = MKCoordinateRegion(center: currentLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001))
            mapView.showAnnotations(mapView.annotations, animated: true)
            mapView.setRegion(mapRegion, animated: true)
        }
        
       
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        //cell.textLabel?.text = "fucking on screen: \(indexPath.row)"
    
        
        print("Here")
        print(indexPath.row)
        cell.imageView?.image = dataArray.last

        count = 0
        print(indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    @IBAction func addPicture(_ sender: UIButton) {
        viewDidAppear(true)
    }
    
    override func viewDidAppear(_ animated: Bool){
        let alertController = UIAlertController(title: "Choose a Photo", message: "Choose from your library or camera to select a picture", preferredStyle: .actionSheet)
        
        alertController.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: {
            (alertAction) in
            print("library")
            self.imagePickerController.sourceType = .photoLibrary
            self.present(self.imagePickerController, animated: true, completion: nil)
            
        }))
        alertController.addAction(UIAlertAction(title: "Camera", style: .destructive, handler: {
            (alertAction) in
            print("camera")
            if(UIImagePickerController.isSourceTypeAvailable(.camera)){
                self.imagePickerController.sourceType = .camera
                self.present(self.imagePickerController, animated: true, completion: nil)
            }
            
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alertAction) in
            print("cancel")
        }))
       
    
        present(alertController,animated: true, completion: nil)
    
    }
        
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        picker.dismiss(animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:
        [UIImagePickerController.InfoKey : Any]){
        let chosenImage = info[.editedImage] as! UIImage
        //imageView.image = chosenImage
        dataArray.append(chosenImage)
        count += 1
        dismiss(animated: true, completion: nil)
        
    }

}

