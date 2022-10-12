//
//  WPStartView.swift
//  WordPlay
//
//  Created by Nebo on 12.10.2022.
//

import SwiftUI

struct WPStartView: View {
    
    @State var longWord = ""
    @State var playerOne = ""
    @State var playerTwo = ""
    
    @State var isShowedGame = false
    
    var body: some View {
        VStack {
          Spacer()
            WPTitleTextView(text: "Word Play")
            
            WPTextFieldView(text: $longWord, placeholder: "Введите длинное слово")
                .padding(20)
                .padding(.top, 32)

            WPTextFieldView(text: $playerOne, placeholder: "Игрок 1")
                .padding(.horizontal, 20)
            WPTextFieldView(text: $playerTwo, placeholder: "Игрок 2")
                .padding(.horizontal, 20)
            
            Button("Играть") {
                isShowedGame.toggle()
            }.font(.custom("AvenirNext-Bold", size: 42))
                .foregroundColor(Color("wpColor4"))
                .padding()
                .padding(.horizontal, 64)
                .background(Color("wpColor2"))
                .cornerRadius(100)
                .padding(.top, 20)
            Spacer()
        }
        .background(Color("wpColor1"))
        .fullScreenCover(isPresented: $isShowedGame, content: {
            
            WPGameView(viewModel: WPGameViewModel(playerOne: playerOne, playerTwo: playerTwo, longWord: longWord)) })
    }
}

struct WPStartView_Previews: PreviewProvider {
    static var previews: some View {
        WPStartView()
    }
}
