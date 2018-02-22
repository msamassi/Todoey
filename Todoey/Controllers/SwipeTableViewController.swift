//
//  SwipeTableViewController.swift
//  Todoey
//
//  Created by Mohamed Samassi on 22/02/2018.
//  Copyright © 2018 Mo Samassi. All rights reserved.
//

import UIKit
import SwipeCellKit

class SwipeTableViewController: UITableViewController, SwipeTableViewCellDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    //MARK: - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! SwipeTableViewCell
        
        cell.delegate = self 
        
        return cell
    }
    
    // MARK: Swipe Cell Delegate Methods
    //added to conform to SwipeTableViewCellDelegate
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            // handle action by updating model with deletion
            
            print("delete Cell")
            
            self.updateModel(at: indexPath)

            print("Category deleted")
        }
        // customize the action appearance
        deleteAction.image = UIImage(named: "delete-icon")
        
        return [deleteAction]
    }
    
    func updateModel(at indexPath : IndexPath){
        //Update data model
        
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeTableOptions {
        var options = SwipeTableOptions()
        options.expansionStyle = .destructive
        //options.transitionStyle = .border
        return options
    }
}
