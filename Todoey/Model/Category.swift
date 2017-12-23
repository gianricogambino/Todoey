//
//  Category.swift
//  Todoey
//
//  Created by gianrico on 23/12/17.
//  Copyright © 2017 gianrico. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    // List descrive in realm una relazione uno a molti
    let items = List<Item>()
}
