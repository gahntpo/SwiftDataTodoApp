//
//  Item.swift
//  TodoApp
//
//  Created by Karin Prater on 01.08.23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
