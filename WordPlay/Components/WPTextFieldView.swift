//
//  WPTextFieldView.swift
//  WordPlay
//
//  Created by Nebo on 12.10.2022.
//

import SwiftUI

struct WPTextFieldView: View {
    
    @State var text: Binding<String>
    var placeholder: String
    
    var body: some View {
        TextField(placeholder, text: text)
            .font(.title2)
            .padding()
            .background(Color.white)
            .cornerRadius(12)
    }
}
