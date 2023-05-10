//
//  RulesScreenRouter.swift
//  TicTacToe
//
//  Created by Елена on 08.05.2023.
//

class RulesScreenRouter {
    
    // MARK: - Private properties
    
    private var goToMainScreenHandler: (() -> Void)?
    
    
    // MARK: - Inits
    
    init(goToMainScreenHandler: (() -> Void)?) {
        self.goToMainScreenHandler = goToMainScreenHandler
    }
}


// MARK: - Public extension

extension RulesScreenRouter: RulesScreenRouterProtocol {
    func goToMainScreen() {
        goToMainScreenHandler?()
    }
}
