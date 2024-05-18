//
//  Item.swift
//  Sample
//
//  Created by steven lee on 19/5/24.
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
