//
//  WPStartViewModel.swift
//  WordPlay
//
//  Created by Nebo on 12.10.2022.
//

import Foundation

class WPStartViewModel: ObservableObject {
    
    @Published var isShowAlert = false
    
    var errorDescription = ""
    
    func checkFields(playerOne: String, playerTwo: String, longWord: String) -> Bool {
        
        if playerOne.count == 0 || playerTwo.count == 0 {
            errorDescription = "Оба игрока должны ввести имя"
            isShowAlert = true
            return false
        } else if longWord.count < 5 {
            errorDescription = "Введите слово длиннее"
            isShowAlert = true
            return false
        }
        return true
    }
}
