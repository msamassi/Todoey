//
//  ViewController.swift
//  Todoey
//
//  Created by Mohamed Samassi on 09/02/2018.
//  Copyright © 2018 Mo Samassi. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController{

    //var itemArray = ["Find iphone 5", "Buy eggos", "Destroy Demogorgon"]
    var itemArray = [Item]()
    let userDefault = UserDefaults.standard

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
        
        print(dataFilePath)
        
        let newItem1 = Item()
        newItem1.title = "Bouncer Tome1"
        itemArray.append(newItem1)
        
        let newItem2 = Item()
        newItem2.title = "Bouncer Tome2"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Bouncer Tome3"
        itemArray.append(newItem3)
        
        //Activate the userDefaults
        if let items = userDefault.array(forKey: "TodoListArray") as? [Item]{
            itemArray = items
        }
        
    }

    //MARK:- Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
       /* if item.done == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }*/
        //Ternary Operator
        //value = condition ? valueIfTrue : valueFalse
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    //MARK:- Tableview Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("\(indexPath.row) - \(itemArray[indexPath.row])")
        /*
        if tableView.cellForRow(at: indexPath)?.accessoryType != .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } */
        
        tableView.cellForRow(at: indexPath)?.accessoryType = itemArray[indexPath.row].done ? .checkmark : .none
        
        itemArray[indexPath.row].done = !(itemArray[indexPath.row].done)
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK:- Add new items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) {
            (action) in
            //What will happen once the user clicks the Add Item button on our UIAlert
//            self.itemArray.append(textField.text!)
           let newItem = Item()
            newItem.title = textField.text!
            newItem.done = false
            
            print("Title : "  + newItem.title + " - ckecked : " + String(newItem.done))
            
            self.itemArray.append(newItem)
         
            self.userDefault.set(self.itemArray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
            
            
            /*
           
            self.userDefault.set(self.itemArray, forKey: "TodoListArray")
            
            */
           
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

