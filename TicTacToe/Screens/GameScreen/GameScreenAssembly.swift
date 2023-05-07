//
//  GameScreenAssembly.swift
//  TicTacToe
//
//  Created by Елена on 07.05.2023.
//

import UIKit

enum GameScreenAssembly {
    static func build() -> UIViewController {
        let router = GameScreenRouter()
        let interactor = GameScreenInteractor()
        let presenter = GameScreenPresenter(interactor: interactor, router: router)
        let viewController = GameScreenViewController(presenter: presenter)
        
        presenter.view = viewController
        interactor.presenter = presenter
        
        return viewController
    }
}
