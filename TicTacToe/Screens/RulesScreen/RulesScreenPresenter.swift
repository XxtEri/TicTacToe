//
//  RulesScreenPresenter.swift
//  TicTacToe
//
//  Created by Елена on 08.05.2023.
//

class RulesScreenPresenter {
    
    // MARK: - Public properties
    
    weak var view: RulesScreenViewControllerProtocol?
    var router: RulesScreenRouterProtocol
    
    
    // MARK: - Inits
    
    init(router: RulesScreenRouterProtocol) {
        self.router = router
    }
}

// MARK: - Public extension

extension RulesScreenPresenter: RulesScreenPresenterProtocol {
    func backToMainScreen() {
        router.goToMainScreen()
    }
}
