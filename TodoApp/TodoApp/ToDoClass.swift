//
//  ToDoClass.swift
//  TodoApp
//
//  Created by Jiaqi Li on 11/21/23.
//

import Foundation
import RealmSwift

class ToDoClass: Object {
    @Persisted(primaryKey: true) var todo: String = ""
    
}
