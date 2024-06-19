//
//  CustomToggleStyle.swift
//  PresentationLayer
//
//  Created by Duy Le on 19/6/2024.
//

import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                configuration.label
            }
        })
    }
    
}
