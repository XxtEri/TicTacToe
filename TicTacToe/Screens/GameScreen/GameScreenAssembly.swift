//
//  GameScreenAssembly.swift
//  TicTacToe
//
//  Created by Елена on 07.05.2023.
//

import UIKit

enum GameScreenAssembly {
    struct Parameters {
        let namesPlayers: (String, String)
        
        let goToMainScreenHandler: (() -> Void)
    }
    
    static func build(with parameters: Parameters) -> UIViewController {
        let router = GameScreenRouter(goToMainScreenHandler: parameters.goToMainScreenHandler)
        let interactor = GameScreenInteractor(namesPlayers: parameters.namesPlayers)
        let presenter = GameScreenPresenter(interactor: interactor, router: router)
        let viewController = GameScreenViewController(presenter: presenter)
        
        presenter.view = viewController
        interactor.presenter = presenter
        
        return viewController
    }
}
