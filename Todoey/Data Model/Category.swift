//
//  Category.swift
//  Todoey
//
//  Created by Mohamed Samassi on 16/02/2018.
//  Copyright © 2018 Mo Samassi. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name : String = ""
    @objc dynamic var colour : String = ""
    let items = List<Item>()
    
}
