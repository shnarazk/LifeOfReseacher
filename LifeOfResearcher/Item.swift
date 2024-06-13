//
//  Item.swift
//  LifeOfResearcher
//
//  Created by 楢崎修二 on 2024/06/13.
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
