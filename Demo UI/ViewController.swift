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

    //MARK: - Outlets
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
    @IBOutlet var allTextFields: [UITextField]!
    @IBOutlet weak var reviewValueLabel: UILabel!
    @IBOutlet var topButtons: [UIButton]!

    //MARK: - Instance variables
    let directory = Directory.instance

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - Private methods
    private func placeFromForm() throws -> Place {
        guard let name = nameTextField.text else {
            throw FormError.nilTextIn(textField: nameTextField)
        }
        guard name.characters.count > 2 else {
            throw FormError.notEnoughtCharactersIn(textField: nameTextField, minCharacters: 3)
        }
        guard let address = addressTextField.text else {
            throw FormError.nilTextIn(textField: addressTextField)
        }
        guard address.characters.count > 2 else {
            throw FormError.notEnoughtCharactersIn(textField: addressTextField, minCharacters: 3)
        }
        guard let lat = latitudeTextField.text, let latDouble = Double(lat) else {
            throw FormError.wrongTypeOfDataIn(textField: latitudeTextField)
        }
        guard let long = longitudeTextField.text, let longDouble = Double(long) else {
            throw FormError.wrongTypeOfDataIn(textField: longitudeTextField)
        }
        guard let websiteUrlString = websiteTextField.text else {
            throw FormError.nilTextIn(textField: websiteTextField)
        }
        guard let wikipediaUrlString = wikiLinkTextField.text else {
            throw FormError.nilTextIn(textField: wikiLinkTextField)
        }

        let place = Place(name: name, address: address, phoneNumber: phoneTextField.text, websiteURL: URL(string: websiteUrlString), wikipediaURL: URL(string: wikipediaUrlString), note: reviewSlider.value, numberOfReviews: 1, latitude: latDouble, longitude: longDouble)
        return place
    }

    private func alert(title: String = "Erreur", message: String = "Quelque chose s'est mal passé", actionTitle: String = "OK") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let cancelAction = UIAlertAction(title: actionTitle, style: .cancel, handler: nil)
        //            let defaultAction = UIAlertAction(title: "Default", style: .default, handler: nil)
        //            let destructiveAction = UIAlertAction(title: "Destructive", style: .destructive, handler: nil)

        alertController.addAction(cancelAction)
        //            alertController.addAction(defaultAction)
        //            alertController.addAction(destructiveAction)

        present(alertController, animated: true, completion: nil)
    }

    //MARK: - IBActions
    @IBAction func savePlace(_ sender: AnyObject) {

        for tf in allTextFields {
            tf.backgroundColor = UIColor.white
        }

        do {
            let place = try placeFromForm()
            directory.add(place: place)
            dismiss(animated: true, completion: nil)
        } catch FormError.nilTextIn(let textField) {
            textField.backgroundColor = UIColor.red
            textField.sayNo()
        } catch FormError.notEnoughtCharactersIn(let textField, let minCharacters) {
            textField.backgroundColor = UIColor.red
            alert(title: "Vérifiez votre saisie", message: "Certains champs n'ont pas assez de caractères. Nombre minimal : \(minCharacters)")
        } catch FormError.wrongTypeOfDataIn(let textField) {
            textField.backgroundColor = UIColor.red
            alert(title: "Vérifiez votre saisie", message: "Certains champs contiennent des caractères non autorisés")
        } catch {
            alert(message: error.localizedDescription)
        }
    }

    @IBAction func cancel(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
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

    //MARK: - Errors definition
    enum FormError: Error {
        case nilTextIn (textField: UITextField)
        case notEnoughtCharactersIn (textField: UITextField, minCharacters: Int)
        case wrongTypeOfDataIn (textField: UITextField)
    }
}

