//
//  ViewController.swift
//  Todoey
//
//  Created by gianrico on 18/12/17.
//  Copyright © 2017 gianrico. All rights reserved.
//

import UIKit
import CoreData

class TodoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    var selectedCategory: Category? {
        didSet {
            //loadItems()
        }
    }
    
    //qui andiamo a richiamare il context dichiarato all'interno di AppDelegate nella parentesi
    //context viene usato quando si attiva l'azione addButtonPressed e il metodo saveItems()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
        return cell
    }
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        saveItems()
        tableView.deselectRow(at: indexPath, animated: true)
        
//        context.delete(itemArray[indexPath.row])
//        itemArray.remove(at: indexPath.row)
    }
    
    //MARK: - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add new todoey item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default, handler: { (action) in
//            let newItem = Item(context: self.context)
//            newItem.title = textField.text!
//            //nel datamodel abbiamo detto che title e done non sono opzionali se non lo valorizziamo sarà nil e quindi errore
//            newItem.done = false
//            //la parenteCategory è il nome della relazione lato Item tra le due entity
//            newItem.parentCategory = self.selectedCategory
//            self.itemArray.append(newItem)
//            self.saveItems()
        })
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func reloadDataButtonPressed(_ sender: UIBarButtonItem) {
        //loadItems()
    }
    
    
    //MARK: - Model Manipulation Methods
    func saveItems() {
        do{
            try context.save()
        } catch {
            print("errors saving context \(error)")
        }
        tableView.reloadData()
    }
    
    // nella chiamata di funzione assumiamo un valore di default Item.fetchRequest()
    // che era quello chiamato originariamente  dalla funzione loadItems()
    //
    //_________________________________________________vvvvvvvvvvvvvvvvvvv
//    func loadItems(with request:NSFetchRequest<Item> = Item.fetchRequest(),with predicate: NSPredicate? = nil) {
//        
//        let categoryPredicate = NSPredicate(format: "parentCategory.name MATCHES %@", selectedCategory!.name!)
//        
//        // se il valore passato in predicate è nil allora carica solo la query delle categorie
//        if let additionalPredicate = predicate {
//            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate, additionalPredicate])
//        } else {
//            request.predicate = categoryPredicate
//        }
//        //queste due righe hanno un problema di unwrap potremmo estrarre un valore nil piantando tutto
//        // quindi si usa un if con optional binding per eliminare questo rischio ed eseguire l'unwrap
////        let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate,predicate!])
////        request.predicate = compoundPredicate
//        
//        do {
//            itemArray = try context.fetch(request)
//        } catch {
//            print("Error fetching data from context \(error)")
//        }
//        tableView.reloadData()
//    }
}

