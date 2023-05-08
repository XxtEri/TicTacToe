//
//  MainScreenAssembly.swift
//  TicTacToe
//
//  Created by Елена on 08.05.2023.
//

import UIKit

enum MainScreenAssembly {
    struct Parameters {
        let goToGameScreenHandler: (() -> Void)
        let goToRulesScreenHandler: (() -> Void)
    }
    
    static func build(with parameters: Parameters) -> UIViewController {
        let router = MainScreenRouter(goToGameScreenHandler: parameters.goToGameScreenHandler,
                                      goToRulesScreenHandler: parameters.goToRulesScreenHandler)
        let interactor = MainScreenInteractor()
        let presenter = MainScreenPresenter(interactor: interactor, router: router)
        let viewController = MainScreenViewController(presenter: presenter)
        
        presenter.view = viewController
        interactor.presenter = presenter
        
        return viewController
    }
}
