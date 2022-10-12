//
//  WPWordCell.swift
//  WordPlay
//
//  Created by Nebo on 12.10.2022.
//

import SwiftUI

struct WPWordCell: View {
    
    let word: String
    
    var body: some View {
        HStack {
            Text(word)
                .listRowSeparator(.hidden)
                .font(.custom("AvenirNext-Bold", size: 20))
                .foregroundColor(.white)
            Spacer()
            Text("\(word.count)")
                .listRowSeparator(.hidden)
                .font(.custom("AvenirNext-Bold", size: 20))
                .foregroundColor(.white)
        }.padding()
    }
}

struct WPWordCell_Previews: PreviewProvider {
    static var previews: some View {
        WPWordCell(word: "слово")
    }
}
