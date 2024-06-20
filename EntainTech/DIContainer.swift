//
//  DIContainer.swift
//  EntainTech
//
//  Created by Duy Le on 19/6/2024.
//

import Foundation
import Swinject
import PresentationLayer
import DomainLayer
import DataLayer

extension Container {
    
    static let sharedContainer: Container = {
        let container = Container()
        let uiTesting = ProcessInfo.processInfo.arguments.contains("Testing")
        
        container.register(ApiServiceProtocol.self) { _ in
            ApiService()
        }
        
        container.register(RaceRemoteDataSourceProtocol.self) { _ in
            RaceRemoteDataSource(apiService: container.resolve(ApiServiceProtocol.self)!)
        }
        
        container.register(RaceRepoProtocol.self) { _ in
            RaceRepo(remoteDatasource: container.resolve(RaceRemoteDataSourceProtocol.self)!)
        }
        
        container.register(RaceInteractorProtocol.self) { _ in
            RaceInteractor(repo: container.resolve(RaceRepoProtocol.self)!)
        }
        
        container.register(RaceListViewModel.self) { _ in
            var viewModel = container.resolve(RaceInteractorProtocol.self)!
            if uiTesting {
                viewModel = ViewResolverMock.RaceInteractorMock()
            }
            return RaceListViewModel(interactor: viewModel)
        }
        
        return container
    }()
    
}
