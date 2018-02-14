//
//  CategoryTableViewController.swift
//  Todoey
//
//  Created by Mohamed Samassi on 14/02/2018.
//  Copyright © 2018 Mo Samassi. All rights reserved.
//

import UIKit
import CoreData

class CategoryTableViewController: UITableViewController {
    var categoriesArray = [Category]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
    }

    // MARK: - Navigation


    @IBAction func AddButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add category", style: .default) {
            (action) in
            let newCategory = Category(context: self.context)
            newCategory.name = textField.text!
            
            self.categoriesArray.append(newCategory)
            
            self.saveCategory()
        }
        
        
        
        alert.addTextField {
            (categoryAlertTextField) in
            categoryAlertTextField.placeholder = "Create new Category"
            textField = categoryAlertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        let category = categoriesArray[indexPath.row]
        
        cell.textLabel?.text = category.name
        
        return cell
    }
    //MARK:- Tableview Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        saveCategory()
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK:- Model handling methods
    func loadCategories(with request : NSFetchRequest<Category> = Category.fetchRequest()){
        do {
            categoriesArray = try context.fetch(request)
        } catch {
            print("Error fetching data : \(error)")
        }
    }
    
    func saveCategory(){
        do {
            try context.save()
        } catch {
            print("Error saving context : \(error)")
        }
        tableView.reloadData()
    }
}
