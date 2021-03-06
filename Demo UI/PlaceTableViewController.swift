//
//  PlaceTableViewController.swift
//  Demo UI
//
//  Created by Ludovic Ollagnier on 19/10/2016.
//  Copyright © 2016 Tec-Tec. All rights reserved.
//

import UIKit

class PlaceTableViewController: UITableViewController {

    let directory = Directory.instance

    override func viewDidLoad() {
        super.viewDidLoad()
        directory.generateDemoData()

        weak var weakSelf = self
        let notCenter = NotificationCenter.default
        notCenter.addObserver(forName: Notification.Name(Constants.NotificationNames.modelUpdated), object: nil, queue: nil) { (notif) in
            weakSelf?.tableView.reloadData()
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return directory.allPlaces.count + 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: UITableViewCell
        switch indexPath.row {
        case directory.allPlaces.count:
            cell = tableView.dequeueReusableCell(withIdentifier: "adCell", for: indexPath)
        default:
            let currentPlace = directory.allPlaces[indexPath.row]
            cell = tableView.dequeueReusableCell(withIdentifier: "placeCell", for: indexPath)
            cell.textLabel?.text = currentPlace.name
            cell.detailTextLabel?.text = currentPlace.address

            //Attention aux "bugs" de recyclage !!
//            if currentPlace.source == .internet {
//                cell.backgroundColor = UIColor.blue
//            } else {
//                cell.backgroundColor = UIColor.green
//            }
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Places"
        default:
            return nil
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "showForm" {
            //Transition vers le formulaire

            //Upcast -> sans danger
//            let vc = ViewController() as UIViewController

            //Downcast
            guard let destination = segue.destination as? ViewController else {
                fatalError("Someone changed the storyboard !!")
            }
            destination.name = "Ludovic"

        } else if segue.identifier == "showDetails" {
            //Transition vers le la vue de détails
            guard let destination = segue.destination as? PlaceDetailsViewController else {
                fatalError("Someone changed the storyboard !!")
            }
            guard let cell = sender as? UITableViewCell else {
                fatalError("The sender is not a cell")
            }
            guard let index = tableView.indexPath(for: cell)?.row else {
                fatalError("The cell is not in the table view")
            }
            destination.place = directory.allPlaces[index]
        }
    }
}
