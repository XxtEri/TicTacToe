//
//  RulesScreenPresenter.swift
//  TicTacToe
//
//  Created by Елена on 08.05.2023.
//

class RulesScreenPresenter {
    var interactor: RulesScreenInteractorProtocol
    var router: RulesScreenRouterProtocol
    weak var view: RulesScreenViewControllerProtocol?
    
    init(interactor: RulesScreenInteractorProtocol, router: RulesScreenRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension RulesScreenPresenter: RulesScreenPresenterProtocol {
    func backToMainScreen() {
        router.goToMainScreen()
    }
}
