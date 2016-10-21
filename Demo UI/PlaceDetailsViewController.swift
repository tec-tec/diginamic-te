//
//  PlaceDetailsViewController.swift
//  Demo UI
//
//  Created by Ludovic Ollagnier on 21/10/2016.
//  Copyright © 2016 Tec-Tec. All rights reserved.
//

import UIKit
import MapKit
import SafariServices

class PlaceDetailsViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var wikipediaStack: UIStackView!
    @IBOutlet weak var phoneStackView: UIStackView!
    @IBOutlet weak var websiteStack: UIStackView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var phoneButton: UIButton!
    @IBOutlet weak var websiteButton: UIButton!
    @IBOutlet weak var wikipediaButton: UIButton!
    @IBOutlet weak var addressLabel: UILabel!

    //MARK: Instance variables
    var place: Place?

    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func configureUI() {
        guard let place = place else {
            fatalError("No place !")
        }

        title = place.name
        addressLabel.text = place.address

        //nil-coalescing operator
//        addressLabel.text = place.phoneNumber ?? "No phone"
//
//        if let phone = place.phoneNumber {
//            addressLabel.text = phone
//        } else {
//            addressLabel.text = "No Phone"
//        }

        if let phone = place.phoneNumber {
            phoneButton.setTitle(phone, for: .normal)
        } else {
            phoneStackView.isHidden = true
        }

        if let website = place.websiteURL?.absoluteString {
            websiteButton.setTitle(website, for: .normal)
        } else {
            websiteStack.isHidden = true
        }

        if let wikipedia = place.wikipediaURL?.absoluteString {
            wikipediaButton.setTitle(wikipedia, for: .normal)
        } else {
            wikipediaStack.isHidden = true
        }

        if let annotation = PlaceAnnotation(place: place) {
            mapView.addAnnotation(annotation)
            let region = MKCoordinateRegion(center: annotation.coordinate, span:MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            mapView.setRegion(region, animated: true)
        }
    }

    @IBAction func call(_ sender: AnyObject) {
        guard let phone = place?.phoneNumber, let phoneURL = URL(string: "tel://\(phone)") else { return }

        if UIApplication.shared.canOpenURL(phoneURL) {
            UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func openWebsite(_ sender: AnyObject) {
        guard let p = place, let url = p.websiteURL else { return }
        openSafariController(url: url)
    }

    @IBAction func openWikipedia(_ sender: AnyObject) {
        guard let p = place, let url = p.wikipediaURL else { return }
        openSafariController(url: url)
    }

    private func openSafariController(url: URL) {
        let controller = SFSafariViewController(url: url)
        present(controller, animated: true, completion: nil)
    }
}
