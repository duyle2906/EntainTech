//
//  RaceCategoriesView.swift
//  PresentationLayer
//
//  Created by Duy Le on 19/6/2024.
//

import SwiftUI
import DomainLayer

struct RaceCategoriesView: View {
    
    @Binding var categories: [DisplayedRaceCategory]
    
    var body: some View {
        HStack(spacing: 20) {
            ForEach($categories) {
                $category in
                HStack {
                    Toggle(isOn: $category.isSelected) {
                        Text(category.category.rawValue)
                    }
                    .toggleStyle(CheckboxToggleStyle())
                    .accessibilityIdentifier("\(ViewIdentifiers.Races.category)_\(category.category.rawValue)")
                    .onChange(of: categories) {
                        output in
                        // automatically select all if all categories are deslected
                        if categories.filter({ $0.isSelected }).isEmpty {
                            for i in 0..<categories.count {
                                categories[i].isSelected = true
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    RaceCategoriesView(categories: .constant([
        DisplayedRaceCategory(category: .greyhound, isSelected: true),
        DisplayedRaceCategory(category: .harness, isSelected: true),
        DisplayedRaceCategory(category: .horse, isSelected: true)
    ]))
}
