//
//  CategoryTableViewController.swift
//  Todoey
//
//  Created by Mohamed Samassi on 14/02/2018.
//  Copyright © 2018 Mo Samassi. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryTableViewController: SwipeTableViewController {

    
    
    let realm = try! Realm()
    
    var categories : Results<Category>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()
        
        tableView.rowHeight = 80.0
    }

    // MARK: - Navigation


    @IBAction func AddButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add category", style: .default) {
            (action) in
            let newCategory = Category()
            newCategory.name = textField.text!
            
            self.save(category: newCategory)
        }
        
        
        
        alert.addTextField {
            (categoryAlertTextField) in
            categoryAlertTextField.placeholder = "Add new Category"
            textField = categoryAlertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1   //nil coalescing operator
    }
    

    //Set the delegate property on SwipeTableViewCell:
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as! SwipeTableViewCell
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No Categories added yet"
        
        //cell.delegate = self
        
        return cell
    }

    
    //MARK:- Tableview Delegate Methods (tapping)
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
   
    
    //Grab the ecatrgory that corresponds to the selected cell
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ToDoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
    }
    
    
    //MARK:- Data Manipulation methods
    func loadCategories(){
        
        categories = realm.objects(Category.self)
        tableView.reloadData()
        
    }
    
    func save(category : Category){
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error saving context : \(error)")
        }
        tableView.reloadData()
    }
    
    //MARK:- Delete data from Swipe
    override func updateModel(at indexPath: IndexPath) {
        if let categoryForDeletion = self.categories?[indexPath.row]{
            do {
                try self.realm.write {
                    self.realm.delete(categoryForDeletion)
                }
            } catch {
                print("Error deleting category : \(error)")
            }
        }
    }
}


