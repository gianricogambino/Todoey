//
//  Item.swift
//  Todoey
//
//  Created by gianrico on 23/12/17.
//  Copyright © 2017 gianrico. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    // LinkingObjects rappresenta esattamente l'inverso di List che abbiamo in Category
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
