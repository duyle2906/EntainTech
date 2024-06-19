//
//  ViewResolverProtocol.swift
//  PresentationLayer
//
//  Created by Duy Le on 19/6/2024.
//

import Foundation
import DomainLayer
import SwiftUI

public protocol ViewResolverProtocol {
    
    func getRaceListView() -> RaceListView
    
}

public struct ViewResolverKey: EnvironmentKey {
    public static var defaultValue: any ViewResolverProtocol = ViewResolverMock()
    
}

public extension EnvironmentValues {
    var viewResolver: any ViewResolverProtocol {
        get { self[ViewResolverKey.self] }
        set { self[ViewResolverKey.self] = newValue }
    }
}
