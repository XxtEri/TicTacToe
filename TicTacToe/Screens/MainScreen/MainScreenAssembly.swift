//
//  MainScreenAssembly.swift
//  TicTacToe
//
//  Created by Елена on 08.05.2023.
//

import UIKit

enum MainScreenAssembly {
    struct Parameters {
        let goToMainScreenHandler: (() -> Void)
    }
    
    static func build(with parameters: Parameters) -> UIViewController {
        let router = MainScreenRouter()
        let interactor = MainScreenInteractor()
        let presenter = MainScreenPresenter(interactor: interactor, router: router)
        let viewController = MainScreenViewController(presenter: presenter)
        
        presenter.view = viewController
        interactor.presenter = presenter
        
        return viewController
    }
}
