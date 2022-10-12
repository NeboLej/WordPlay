//
//  WPGameViewModel.swift
//  WordPlay
//
//  Created by Nebo on 12.10.2022.
//

import Foundation

class WPGameViewModel: ObservableObject {
    
    @Published var playerOne: WPPlayerModel
    @Published var playerTwo: WPPlayerModel
    @Published var words = [String]()
    
    let longWord: String
    var isFirst = true
    
    init(playerOne: String, playerTwo: String, longWord: String) {
        self.playerOne = WPPlayerModel(name: playerOne)
        self.playerTwo = WPPlayerModel(name: playerTwo)
        self.longWord = longWord.lowercased()
    }
    
    func game(word: String) -> Bool {
        
        guard validate(word: word) else { return false }
        
        words.append(word)
        if isFirst {
            playerOne.add(score: word.count)
        } else {
            playerTwo.add(score: word.count)
        }
        
        isFirst.toggle()
        
        return true
    }
    
    private func validate(word: String) -> Bool {
        
        let word = word.lowercased()
        
        guard word != longWord else {
            print("Это изначальное слово")
            return false }
        
        guard !words.contains(word) else {
            print("Слово уже было")
            return false }
        
        guard word.count > 1 else {
            print("Слово слишком короткое")
            return false }
        
        let bigWordArray = wordToChars(word: longWord)
        let smallWordArray = wordToChars(word: word)
        
        for char in smallWordArray {
            if !bigWordArray.contains(char) {
                print("В слове есть буквы, которые нельзя использовать")
                return false
            }
        }
        
        return true
    }
    
    private func wordToChars(word: String) -> [Character] {
        word.lowercased().map { $0 }
    }
}
