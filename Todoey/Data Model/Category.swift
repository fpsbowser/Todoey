//
//  Category.swift
//  Todoey
//
//  Created by Dakota Pratt on 2/14/19.
//  Copyright © 2019 Dakota Pratt. All rights reserved.
//

import Foundation
import RealmSwift

class Category : Object {
    @objc dynamic var name : String = ""
    let items = List<Item>()
}
