//
//  MainScreenPresenter.swift
//  TicTacToe
//
//  Created by Елена on 08.05.2023.
//

import Foundation

class MainScreenPresenter {
    var interactor: MainScreenInteractorProtocol
    var router: MainScreenRouterProtocol
    weak var view: MainScreenViewControllerProtocol?
    
    init(interactor: MainScreenInteractorProtocol, router: MainScreenRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension MainScreenPresenter: MainScreenPresenterProtocol {
    
}
