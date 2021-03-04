//
//  AppAssembly.swift
//  GetMeCab
//
//  Created by Yogesh on 01/03/21.
//  Copyright © 2021 Yogesh Aherwar. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

class AppAssembly: Assembly {
    
    private let container: Container
    
    init(_ parentContainer: Container) {
        self.container = parentContainer
    }
    
    func assemble(container: Container) {
        assembleUseCase()
        assembleViewController()
    }
    
    func assembleUseCase() {
        container.register(UseCaseType.self) { r in
            return UseCase()
        }
    }
    
    func assembleViewController() {
        container.register(ViewModel.self) { resolver in
            let useCase = resolver.resolve(UseCaseType.self)!
            return ViewModel(useCase: useCase)
        }
        container.storyboardInitCompleted(ViewController.self) { resolver, controller in
            controller.viewModel = resolver.resolve(ViewModel.self)
        }
    }
}
