//
//  EntainTechApp.swift
//  EntainTech
//
//  Created by Duy Le on 19/6/2024.
//

import SwiftUI

@main
struct EntainTechApp: App {
    var body: some Scene {
        let viewResolver = ViewResolver()
        return WindowGroup {
            viewResolver.getRaceListView()
                .environment(\.viewResolver, viewResolver)
        }
    }
}
