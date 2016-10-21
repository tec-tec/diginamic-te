//
//  PlaceDetailsViewController.swift
//  Demo UI
//
//  Created by Ludovic Ollagnier on 21/10/2016.
//  Copyright © 2016 Tec-Tec. All rights reserved.
//

import UIKit
import MapKit

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
    }
}