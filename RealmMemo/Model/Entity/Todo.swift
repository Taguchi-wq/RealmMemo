//
//  Todo.swift
//  RealmMemo
//
//  Created by cmStudent on 2021/09/04.
//

import Foundation
import RealmSwift

class Todo: Object {
    @objc dynamic var name = ""
    
    
    convenience init(name: String) {
        self.init()
        
        self.name = name
    }
}
