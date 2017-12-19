//
//  ViewController.swift
//  Todoey
//
//  Created by gianrico on 18/12/17.
//  Copyright © 2017 gianrico. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = ["Primo elemento","Secondo elemento","Terzo elemento"]
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //attiva l'effetto a scomparsa della selezione della riga
        tableView.deselectRow(at: indexPath, animated: true)
        //attiva la selezione e deselezione della riga col checkmark
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }
    
    //MARK: - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        //Costruiamo una variabile locale richiamabile anche da dentro la closure
        var textField = UITextField()
        
        //COSTRUISCEALERT CONTROLLER DENTRO CUI STANNO GLI ALERT ACTION
        let alert = UIAlertController(title: "Add new todoey item", message: "", preferredStyle: .alert)
        
        //PULSANTE E RELATIVA SUA AZIONE IN CLOSURE
        let action = UIAlertAction(title: "Add Item", style: .default, handler: { (action) in
            //QUI CASCA LA CLOSURE ESEGUITA AL CLIC
            self.itemArray.append(textField.text!)
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

