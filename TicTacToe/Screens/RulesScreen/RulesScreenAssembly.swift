//
//  RulesScreenAssembly.swift
//  TicTacToe
//
//  Created by Елена on 08.05.2023.
//

import UIKit

enum RulesScreenAssembly {
    struct Parameters {        
        let goToMainScreenHandler: (() -> Void)
    }
    
    static func build(with parameters: Parameters) -> UIViewController {
        let router = RulesScreenRouter(goToMainScreenHandler: parameters.goToMainScreenHandler)
        let interactor = RulesScreenInteractor()
        let presenter = RulesScreenPresenter(interactor: interactor, router: router)
        let viewController = RulesScreenViewController(presenter: presenter)
        
        presenter.view = viewController
        interactor.presenter = presenter
        
        return viewController
    }
}
