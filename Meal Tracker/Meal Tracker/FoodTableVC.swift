//
//  FoodTableVC.swift
//  Meal Tracker
//
//  Created By Sameer Verma - 21scse1011328
// Happyverma805@gmail.com//

//

import UIKit

class FoodTableVC: UITableViewController {
    
    var meals: [Meal] {
        let eggs        = Food(name: "Eggs", description: "Poached eggs ")
        let bread       = Food(name: "Bread", description: "Fresh bread")
        let cheese      = Food(name: "Cheese", description: "Fresh cheese")
        let spaghetti   = Food(name: "Spaghetti", description: "Hand made spaghetti")
        
        let meatballs   = Food(name: "Meatball", description: "Nice meatballs")
        let pizza       = Food(name: "Pizza", description: "Big pizza")
        let potato      = Food(name: "Potato", description: "Mashed potato")
        let salat       = Food(name: "Salat", description: "Fresh salat")
        
        let appleCake   = Food(name: "Apple Cake", description: "Round appleCake")
        let iceCream    = Food(name: "Icecream", description: "Big Icecream")
        
        let breakfast   = Meal(name: "Breakfast", food: [eggs, bread, cheese])
        let lunch       = Meal(name: "Lunch", food: [spaghetti, meatballs, pizza])
        let dinner      = Meal(name: "Dinner", food: [potato, salat, appleCake, iceCream])
        
        return [breakfast, lunch, dinner]
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return meals[0].food.count
        case 1:
            return meals[1].food.count
        case 2:
            return meals[2].food.count
        default:
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath)

        switch indexPath.section {
        case 0:
            cell.textLabel?.text = meals[0].food[indexPath.row].name
            cell.detailTextLabel?.text = meals[0].food[indexPath.row].description
        case 1:
            cell.textLabel?.text = meals[1].food[indexPath.row].name
            cell.detailTextLabel?.text = meals[1].food[indexPath.row].description
        case 2:
            cell.textLabel?.text = meals[2].food[indexPath.row].name
            cell.detailTextLabel?.text = meals[2].food[indexPath.row].description
        default:
            cell.textLabel?.text = "Should not happen"
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return meals[0].name
        case 1:
            return meals[1].name
        case 2:
            return meals[2].name
        default:
            return nil
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
