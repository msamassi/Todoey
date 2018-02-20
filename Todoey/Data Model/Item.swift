//
//  Item.swift
//  Todoey
//
//  Created by Mohamed Samassi on 16/02/2018.
//  Copyright © 2018 Mo Samassi. All rights reserved.
//

import Foundation
import RealmSwift

class Item : Object{
    @objc dynamic var title : String = ""
    @objc dynamic var done : Bool = false
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
