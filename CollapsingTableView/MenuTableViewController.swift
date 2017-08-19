//
//  MenuTableViewController.swift
//  CollapsingTableView
//
//  Created by Subhadeep Pal on 19/08/17.
//  Copyright © 2017 Subhadeep Pal. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    var menuItem1 = Modal(name: "Submenu 1", subMenu: [])
    var menuItem2 = Modal(name: "Submenu 2", subMenu: [])
    var menuItem3 = Modal(name: "Submenu 3", subMenu: [])
    var menuItem4 = Modal(name: "Submenu 4", subMenu: [])
    var menuItem5 = Modal(name: "Submenu 5", subMenu: [])
    
    var menuItem11 = Modal(name: "Submenu 11", subMenu: [])
    var menuItem21 = Modal(name: "Submenu 21", subMenu: [])
    var menuItem31 = Modal(name: "Submenu 31", subMenu: [])
    var menuItem41 = Modal(name: "Submenu 41", subMenu: [])
    var menuItem51 = Modal(name: "Submenu 51", subMenu: [])
    
    
    
    
    
    
    
    var displayItems : [Modal] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        
        var dataSet1 = [Modal(name: "menu item 1", subMenu: [menuItem1, menuItem2, menuItem3, menuItem4, menuItem5]),
                        Modal(name: "menu item 2", subMenu: [menuItem11, menuItem21, menuItem31, menuItem41, menuItem51])]
        
        let dataSet2 = [Modal(name: "item 1", subMenu: [dataSet1[0], menuItem2, menuItem3, menuItem4, menuItem5]),
                        Modal(name: "item 2", subMenu: [dataSet1[1], menuItem2, menuItem3, menuItem4, menuItem5])]
        
        displayItems = dataSet2
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return displayItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = displayItems[indexPath.row].name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if displayItems[indexPath.row].isExpanded == true {
            // remove elements
            for i in 0..<displayItems[indexPath.row].subMenu.count {
                displayItems.remove(at: (indexPath.row + 1))
            }
            displayItems[indexPath.row].isExpanded = false
        } else {
            // add subMenuItems
            displayItems.insert(contentsOf: displayItems[indexPath.row].subMenu, at: (indexPath.row + 1))
            displayItems[indexPath.row].isExpanded = true
        }
        
        tableView.reloadData()
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
