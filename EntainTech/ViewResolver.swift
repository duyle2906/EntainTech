//
//  ViewResolver.swift
//  EntainTech
//
//  Created by Duy Le on 19/6/2024.
//

import DomainLayer
import Foundation
import PresentationLayer
import Swinject

class ViewResolver: ViewResolverProtocol {
    
    func getRaceListView() -> RaceListView {
        return RaceListView(viewModel: Container.sharedContainer.resolve(RaceListViewModel.self)!)
    }
    
}
