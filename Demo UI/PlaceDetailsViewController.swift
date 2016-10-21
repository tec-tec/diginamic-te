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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
