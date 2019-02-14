//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Dakota Pratt on 2/13/19.
//  Copyright © 2019 Dakota Pratt. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: UITableViewController {

    let realm = try! Realm()
    
    var categories : Results<Category>?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()
        
    }
    
    //MARK: - TableView Datasource Methods : Display all the categories that are inside the persistant container
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No categories added yet"
        
        return cell
        
    }
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ToDoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
    }
    
    
    //MARK: - Data Manipulation Methods : Save data and Load data so we can use CRUD
    func saveCategories(category : Category) {
        
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error saving context \(error)")
        }
        
        tableView.reloadData()
    }
    
    func loadCategories() {
        
        categories = realm.objects(Category.self)
        tableView.reloadData()
    }

    
    //MARK: - Add New Categories using our category entity
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Create new category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            
            let newCategory = Category()
            newCategory.name = textField.text!

            self.saveCategories(category: newCategory)
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Name of category"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    

}

