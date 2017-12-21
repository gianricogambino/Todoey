//
//  Item.swift
//  Todoey
//
//  Created by gianrico on 20/12/17.
//  Copyright © 2017 gianrico. All rights reserved.
//

import Foundation

// invece che mettere i due protocolli encodable e decodable ne usiamo uno comune per entrabi
class Item: Codable {
    
    var title:String = ""
    var done: Bool = false
    
}
