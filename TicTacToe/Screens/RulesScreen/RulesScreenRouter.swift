//
//  RulesScreenRouter.swift
//  TicTacToe
//
//  Created by Елена on 08.05.2023.
//

class RulesScreenRouter {
    private var goToMainScreenHandler: (() -> Void)?
    
    init(goToMainScreenHandler: (() -> Void)?) {
        self.goToMainScreenHandler = goToMainScreenHandler
    }
}

extension RulesScreenRouter: RulesScreenRouterProtocol {
    func goToMainScreen() {
        goToMainScreenHandler?()
    }
}
