//
//  WPGameViewModel.swift
//  WordPlay
//
//  Created by Nebo on 12.10.2022.
//

import Foundation


enum WordError: Error {
    case theSameWord
    case beforeWord
    case littleWord
    case wrongWord
}
class WPGameViewModel: ObservableObject {
    
    @Published var playerOne: WPPlayerModel
    @Published var playerTwo: WPPlayerModel
    @Published var words = [String]()
    
    var errorDescription = ""
    let longWord: String
    var isFirst = true
    
    init(playerOne: String, playerTwo: String, longWord: String) {
        self.playerOne = WPPlayerModel(name: playerOne)
        self.playerTwo = WPPlayerModel(name: playerTwo)
        self.longWord = longWord.lowercased()
    }
    
    func game(word: String) throws -> Bool {
        
        do {
            try validate(word: word)
        } catch {
            throw error
        }
        
        words.append(word)
        if isFirst {
            playerOne.add(score: word.count)
        } else {
            playerTwo.add(score: word.count)
        }
        
        isFirst.toggle()
        
        return true
    }
    
    private func validate(word: String) throws {
        
        let word = word.lowercased()
        
        guard word != longWord else {
            errorDescription = "Это изначальное слово"
            throw WordError.theSameWord
            }
        
        guard !words.contains(word) else {
            errorDescription = "Слово уже было"
            throw WordError.beforeWord
            }
        
        guard word.count > 1 else {
            errorDescription = "Слово слишком короткое"
            throw WordError.littleWord
            }
        
        let bigWordArray = wordToChars(word: longWord)
        let smallWordArray = wordToChars(word: word)
        
        for char in smallWordArray {
            if !bigWordArray.contains(char) {
                errorDescription = "В слове есть буквы, которые нельзя использовать"
                throw WordError.wrongWord
            }
        }
    }
    
    private func wordToChars(word: String) -> [Character] {
        word.lowercased().map { $0 }
    }
}
