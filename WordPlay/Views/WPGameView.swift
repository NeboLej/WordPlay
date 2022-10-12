//
//  WPGameView.swift
//  WordPlay
//
//  Created by Nebo on 12.10.2022.
//

import SwiftUI

struct WPGameView: View {
    
    @State var text = ""
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Button("Выход") {
                    print("выход")
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
            Text("БольшоеСлово")
                .font(.custom("AvenirNext-Bold", size: 36))
                .foregroundColor(.white)
            
            HStack(spacing: 12) {
                VStack {
                    Text("0")
                        .font(.custom("AvenirNext-Bold", size: 60))
                        .foregroundColor(.white)
                    Text("Name")
                        .font(.custom("AvenirNext-Bold", size: 24))
                        .foregroundColor(.white)
                }
                .padding(20)
                .frame(width: screen.width / 2.2, height: screen.width / 2.2 )
                .background(Color("wpColor3"))
                .cornerRadius(24)
                .shadow(color: .blue, radius: 10)
                .opacity(0.4)
                
                VStack {
                    Text("0")
                        .font(.custom("AvenirNext-Bold", size: 60))
                        .foregroundColor(.white)
                    Text("Name")
                        .font(.custom("AvenirNext-Bold", size: 24))
                        .foregroundColor(.white)
                }
                .padding(20)
                .frame(width: screen.width / 2.2, height: screen.width / 2.2 )
                .background(Color("wpColor3"))
                .cornerRadius(24)
                .shadow(color: .blue, radius: 10)
                .opacity(1)
            }
            
            WPTextFieldView(text: $text, placeholder: "Ваше слово")
                .padding(.horizontal)
            
            Button {
                print("готово")
                text = ""
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
                
            }.listStyle(.plain)
                .frame(maxWidth: .infinity ,maxHeight: .infinity)
        }.background(Color("wpColor1"))
    }
}

struct WPGameView_Previews: PreviewProvider {
    static var previews: some View {
        WPGameView()
    }
}
