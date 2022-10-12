//
//  WPPlayerModel.swift
//  WordPlay
//
//  Created by Nebo on 12.10.2022.
//

import Foundation

struct WPPlayerModel {
    
    let name: String
    private(set) var score: Int = 0
    
    mutating func add(score: Int) {
        self.score += score
    }
}
