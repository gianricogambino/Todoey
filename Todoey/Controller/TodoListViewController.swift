//
//  ViewController.swift
//  Todoey
//
//  Created by gianrico on 18/12/17.
//  Copyright © 2017 gianrico. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //per caricare i dati salvati in locale con if let per non farlo crashare se per caso non ci fossero i dati
        
//        let newItem = Item()
//        newItem.title = "Primo elemento"
//        itemArray.append(newItem)
//
//        let newItem2 = Item()
//        newItem2.title = "Secondo elemento"
//        itemArray.append(newItem2)
//
//        let newItem3 = Item()
//        newItem3.title = "Terzo elemento"
//        itemArray.append(newItem3)
        
        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
            itemArray = items
        }
    }

    //MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        //con la let item non ripetiamo venti volte itemArray[indexPath.row]
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        //qui sostituiamo questo if con un operatore ternario
//        if item.done == true {
//            cell.accessoryType = .checkmark
//        } else {
//            cell.accessoryType = .none
//        }
        // OPERATORE TERNARIO
        // valore = condizione ? valoreSeVero : valoreSeFalso
        cell.accessoryType = item.done ? .checkmark : .none
        return cell
    }
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        TUTTE QUESTE RIGHE
//        if itemArray[indexPath.row].done == false {
//            itemArray[indexPath.row].done = true
//        } else {
//            itemArray[indexPath.row].done = false
//        }
//        SONO SOSTITUITA DA UNA SOLA RIGA QUI SOTTO
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        //Costruiamo una variabile locale richiamabile anche da dentro la closure
        var textField = UITextField()
        
        //COSTRUISCEALERT CONTROLLER DENTRO CUI STANNO GLI ALERT ACTION
        let alert = UIAlertController(title: "Add new todoey item", message: "", preferredStyle: .alert)
        
        //PULSANTE E RELATIVA SUA AZIONE IN CLOSURE
        let action = UIAlertAction(title: "Add Item", style: .default, handler: { (action) in
            
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            
            //QUI CASCA LA CLOSURE ESEGUITA AL CLIC
            //self.itemArray.append(textField.text!)
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            self.tableView.reloadData()
        })
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
}

