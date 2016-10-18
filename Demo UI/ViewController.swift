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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func savePlace(_ sender: AnyObject) {
    }

    @IBAction func cancel(_ sender: AnyObject) {
    }
    
    @IBAction func autoCoordinatesSwitchValueChanged(_ sender: UISwitch) {

        for tf in coordinateTextFields {
            tf.isEnabled = !sender.isOn
        }
    }


}

