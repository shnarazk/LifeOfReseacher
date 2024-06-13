//
//  Item.swift
//  LifeOfResearcher
//
//  Created by 楢崎修二 on 2024/06/13.
//

import Foundation
import SwiftData

// これはタスクに相当するようだ
@Model
final class Item {
    var timestamp: Date
    var name: String

    init(timestamp: Date, name: String) {
        self.timestamp = timestamp
        self.name = name
    }
}
