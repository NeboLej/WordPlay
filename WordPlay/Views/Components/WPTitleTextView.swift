//
//  WPTitleTextView.swift
//  WordPlay
//
//  Created by Nebo on 12.10.2022.
//

import SwiftUI

struct WPTitleTextView: View {
    
    @State var text: String
    
    var body: some View {
        Text(text)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("wpColor2"))
            .foregroundColor(Color("wpColor4"))
            .font(.custom("AvenirNext-Bold", size: 42))
    }
}

struct WPTitleTextView_Previews: PreviewProvider {
    static var previews: some View {
        WPTitleTextView(text: "БольшоеСлово")
    }
}
