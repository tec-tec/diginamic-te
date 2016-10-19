//
//  ViewController.swift
//  Demo UI
//
//  Created by Ludovic Ollagnier on 18/10/2016.
//  Copyright © 2016 Tec-Tec. All rights reserved.
//

import UIKit

// Class xxxx is not key value coding compliant for key yyy (Au lancement de l'app)
// Unrecognized selector sent to instance (Au déclenchement d'une action)

class ViewController: UIViewController {


    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var setWithCurrentLocationSwitch: UISwitch!
    @IBOutlet weak var latitudeTextField: UITextField!
    @IBOutlet weak var longitudeTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var websiteTextField: UITextField!
    @IBOutlet weak var wikiLinkTextField: UITextField!
    @IBOutlet weak var reviewSlider: UISlider!
    @IBOutlet var coordinateTextFields: [UITextField]!
    @IBOutlet weak var reviewValueLabel: UILabel!

    private var placeFromForm: Place? {
        guard let name = nameTextField.text else { return nil }
        guard name.characters.count > 2 else { return nil }
        guard let address = addressTextField.text else { return nil}
        guard address.characters.count > 2 else { return nil }
        guard let lat = latitudeTextField.text, let latDouble = Double(lat) else { return nil}
        guard let long = longitudeTextField.text, let longDouble = Double(long) else { return nil}
        guard let websiteUrlString = websiteTextField.text else { return nil }
        guard let wikipediaUrlString = wikiLinkTextField.text else { return nil }

        let place = Place(name: name, address: address, phoneNumber: phoneTextField.text, websiteURL: URL(string: websiteUrlString), wikipediaURL: URL(string: wikipediaUrlString), note: reviewSlider.value, numberOfReviews: 1, latitude: latDouble, longitude: longDouble)
        return place
    }

    let directory = Directory()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func savePlace(_ sender: AnyObject) {
        guard let place = placeFromForm else { return }
        directory.add(place: place)
    }

    @IBAction func cancel(_ sender: AnyObject) {
    }

    @IBAction func autoCoordinatesSwitchValueChanged(_ sender: UISwitch) {
        for tf in coordinateTextFields {
            tf.isEnabled = !sender.isOn
        }
    }

    @IBAction func reviewValueChanged(_ sender: UISlider) {
        let intValue = Int(sender.value)
        reviewValueLabel.text = "\(intValue)"
        sender.value = Float(intValue)
    }

}

