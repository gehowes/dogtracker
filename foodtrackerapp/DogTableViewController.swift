//
//  DogTableViewController.swift
//  foodtrackerapp
//
//  Created by Gwendolyn Howes on 09/02/2020.
//  Copyright © 2020 Gwendolyn Howes. All rights reserved.
//

import UIKit
import os.log

class DogTableViewController: UITableViewController {
    //MARK: Properties
    
    var dogs = [Dog]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Use the edit button item provided by the table view controller.
        navigationItem.leftBarButtonItem = editButtonItem

        // Load the sample data
        loadSampleDogs()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogs.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "DogTableViewCell"
        
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? DogTableViewCell else {
            fatalError("The dequeued cell is not an instance of DogTableViewCell.")
        }
        
        // Fetches the appropriate dog for the data source layout.
        let dog = dogs[indexPath.row]
        
        cell.nameLabel.text = dog.name
        cell.photoImageView.image = dog.photo
        cell.ratingControl.rating = dog.rating

        return cell
    }


    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            dogs.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            
        case "AddItem":
            os_log("Adding a new dog.", log: OSLog.default, type: .debug)
            
        case "ShowDetail":
        guard let dogDetailViewController = segue.destination as?
    DogViewController else {
        fatalError("Unexpected destination: \(segue.destination)")
        }
         
        guard let selectedDogCell = sender as? DogTableViewCell else {
            fatalError("Unexpected sender: \(String(describing: sender))")
        }
        
        guard let indexPath = tableView.indexPath(for: selectedDogCell) else {
            fatalError("The selected cell is not being displayed by the table")
        }
        
        let selectedDog = dogs[indexPath.row]
        dogDetailViewController.dog = selectedDog
            
        default:
            fatalError("Unexpected Segue Identifier: \(String(describing: segue.identifier))")
        }
    }
    
    
    //MARK: Actions
    
    @IBAction func unwindToDogList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? DogViewController, let dog = sourceViewController.dog {
            
             if let selectedIndexPath = tableView.indexPathForSelectedRow {
                //Update an existing dog.
                dogs[selectedIndexPath.row] = dog
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
            else {
                // Add a new dog.
                let newIndexPath = IndexPath(row: dogs.count, section: 0)
                       
                dogs.append(dog)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
        
    }

    //MARK: Private Methods
    
    private func loadSampleDogs() {
        let photo1 = UIImage(named: "dog1")
        let photo2 = UIImage(named: "dog2")
        let photo3 = UIImage(named: "dog3")
    
        guard let dog1 = Dog(name: "Atticus", photo: photo1, rating: 5) else {
            fatalError("Unable to instantiate dog1")
        }
    
        guard let dog2 = Dog(name: "Tyde", photo: photo2, rating: 5) else {
            fatalError("Unable to instantiate dog2")
        }
    
        guard let dog3 = Dog(name: "Jack", photo: photo3, rating: 4) else {
            fatalError("Unable to instantiate dog3")
        }
    
        dogs += [dog1, dog2, dog3]
    }
    
}
