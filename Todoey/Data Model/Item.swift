//
//  Item.swift
//  Todoey
//
//  Created by Mohamed Samassi on 10/02/2018.
//  Copyright © 2018 Mo Samassi. All rights reserved.
//

import Foundation
class Item : Encodable, Decodable {
    var title : String = ""
    var done : Bool = false
}
