//
//  RealmManager.swift
//  RealmMemo
//
//  Created by cmStudent on 2021/09/04.
//

import Foundation
import RealmSwift

final class RealmManager {
    
    static let shared = RealmManager()
    private let realm = try! Realm()
    
    
    private init() {}
    
    
    private func write<T: Object>(_ object: T) {
        do {
            try realm.write { realm.add(object) }
        } catch {
            print(error)
        }
    }
    
    
    func savedTodo(name: String) {
        let todo = Todo(name: name)
        write(todo)
    }
    
    func load<T: Object>(_ object: T.Type) -> Results<T> {
        return realm.objects(object)
    }
    
}
