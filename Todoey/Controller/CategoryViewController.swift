//
//  CategoryViewController.swift
//  Todoey
//
//  Created by gianrico on 22/12/17.
//  Copyright © 2017 gianrico. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: UITableViewController {
    
    let realm = try! Realm()
    
    var categories:Results<Category>!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategoryItems()
    }
    
    //MARK: _ Add new categories
    
    @IBAction func addCategoryButoonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()

        let alert = UIAlertController(title: "Add new Todoey Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Category", style: .default, handler: { (action) in
            let newCategory = Category()
            newCategory.name = textField.text!
            //non serve perché il tipo dati Results è autoupdating
            //self.categories.append(newCategory)
            self.save(category: newCategory)
        })
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new Category"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: - TableView datasource methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        let category = categories[indexPath.row]
        cell.textLabel?.text = category.name
        return cell
    }
    
    //MARK: - TableView delegate methods

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "goToItems", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! TodoListViewController
        
        // indexPathsForSelectedRows identifica la riga selezionata
        // siccome è un valore optional eseguiamo il suo check/unwrap con if let
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories[indexPath.row]
        }
    }
    
    //MARK: - Data manipulation methods
    
    func save(category: Category) {
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("errors saving realm \(error)")
        }
        tableView.reloadData()
    }
    
    func loadCategoryItems() {
        categories = realm.objects(Category.self)
//        do {
//            categoryArray = try context.fetch(request)
//        } catch {
//            print("Error fetching data from context \(error)")
//        }
        tableView.reloadData()
    }
}
