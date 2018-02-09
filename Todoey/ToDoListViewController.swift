//
//  ViewController.swift
//  Todoey
//
//  Created by Mohamed Samassi on 09/02/2018.
//  Copyright © 2018 Mo Samassi. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController{

    var itemArray = ["Find iphone 5", "Buy eggos", "Destroy Demogorgon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK:- Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    //MARK:- Tableview Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row) - \(itemArray[indexPath.row])")
        if tableView.cellForRow(at: indexPath)?.accessoryType != .checkmark {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        } else {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }

        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    //MARK:- Add new items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) {
            (action) in
            //What will happen once the user clicks the Add Item button on our UIAlert
            self.itemArray.append(textField.text!)
           
            self.tableView.reloadData()
           print(self.itemArray)
        }
        
        alert.addTextField {
            (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
}

