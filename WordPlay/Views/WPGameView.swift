//
//  WPGameView.swift
//  WordPlay
//
//  Created by Nebo on 12.10.2022.
//

import SwiftUI

struct WPGameView: View {
    
    @State var text = ""
    @State var isConformShow = false
    @State var isAllertShow = false
    @Environment(\.dismiss) var dismiss
    var viewModel: WPGameViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Button("Выход") {
                    isConformShow = true
                }
                .padding(6)
                .padding(.horizontal)
                .background(Color("wpColor3"))
                .foregroundColor(Color("wpColor1"))
                .cornerRadius(12)
                .padding(6)
                .font(.title2)
                
                Spacer()
            }
            Text(viewModel.longWord)
                .font(.custom("AvenirNext-Bold", size: 36))
                .foregroundColor(.white)
            
            HStack(spacing: 12) {
                VStack {
                    Text("\(viewModel.playerOne.score)")
                        .font(.custom("AvenirNext-Bold", size: 60))
                        .foregroundColor(.white)
                    Text(viewModel.playerOne.name)
                        .font(.custom("AvenirNext-Bold", size: 24))
                        .foregroundColor(.white)
                }
                .padding(20)
                .frame(width: screen.width / 2.2, height: screen.width / 2.2 )
                .background(Color("wpColor3"))
                .cornerRadius(24)
                .shadow(color: .blue, radius: 10)
                .opacity( viewModel.isFirst ? 1.0 : 0.4)
                
                VStack {
                    Text("\(viewModel.playerTwo.score)")
                        .font(.custom("AvenirNext-Bold", size: 60))
                        .foregroundColor(.white)
                    Text(viewModel.playerTwo.name)
                        .font(.custom("AvenirNext-Bold", size: 24))
                        .foregroundColor(.white)
                }
                .padding(20)
                .frame(width: screen.width / 2.2, height: screen.width / 2.2 )
                .background(Color("wpColor3"))
                .cornerRadius(24)
                .shadow(color: .blue, radius: 10)
                .opacity(!viewModel.isFirst ? 1.0 : 0.4)
            }
            
            WPTextFieldView(text: $text, placeholder: "Ваше слово")
                .padding(.horizontal)
            
            Button {
                do {
                    if try viewModel.game(word: text) {
                        text = ""
                    }
                } catch {
                    isAllertShow = true
                }
                
            } label: {
                Text("Готово")
                    .padding(12)
                    .foregroundColor(.white)
                    .font(.custom("AvenirNext-Bold", size: 26))
                
            }.frame(maxWidth: .infinity)
                .background(Color("wpColor4"))
                .cornerRadius(12)
                .padding(.horizontal)
            
            List {
                ForEach(0..<viewModel.words.count, id: \.description) { id in
                    WPWordCell(word: viewModel.words[id])
                        .background(id % 2 == 0 ? Color.black : Color.gray)
                        .listRowInsets(EdgeInsets())
                }
            }.listStyle(.plain)
                .frame(maxWidth: .infinity ,maxHeight: .infinity)
        }.background(Color("wpColor1"))
            .confirmationDialog("Вы точно ходите закончить игру?", isPresented: $isConformShow, titleVisibility: .visible) {
                Button(role: .destructive) {
                    dismiss()
                } label: {
                    Text("Да")
                }
                Button(role: .cancel) {
                    
                } label: {
                    Text("Нет")
                }
            }
            .alert(viewModel.errorDescription, isPresented: $isAllertShow) {
                Text("Ok")
            }
    }
}

struct WPGameView_Previews: PreviewProvider {
    static var previews: some View {
        WPGameView(viewModel: WPGameViewModel(playerOne: "Вася", playerTwo: "Петя", longWord: "Абракадабра"))
    }
}
