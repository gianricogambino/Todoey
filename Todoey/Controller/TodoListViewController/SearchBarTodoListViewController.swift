//
//  Ext_TodoListViewController.swift
//  Todoey
//
//  Created by gianrico on 23/12/17.
//  Copyright © 2017 gianrico. All rights reserved.
//

import Foundation
import UIKit
import CoreData


//MARK: - Search bar methods

//class SearchBarTodoListViewController:TodoListViewController, UISearchBarDelegate {
//    
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        
//        let request: NSFetchRequest<Item> = Item.fetchRequest()
//        
//        // il format è una sorta di SQL
//        let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
//        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
//        
//        loadItems(with: request, with: predicate)
//    }
//    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchBar.text?.count == 0 {
//            loadItems()
//            DispatchQueue.main.async {
//                searchBar.resignFirstResponder()
//            }
//        }
//    }
//}

