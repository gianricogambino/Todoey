//
//  Ext_TodoListViewController.swift
//  Todoey
//
//  Created by gianrico on 23/12/17.
//  Copyright © 2017 gianrico. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift


//MARK: - Search bar methods

//class SearchBarTodoListViewController:TodoListViewController, UISearchBarDelegate {
//    
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        todoItems = todoItems?.filter("title CONTAINS[cd] %@", searchBar.text!)
//        tableView.reloadData()
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

