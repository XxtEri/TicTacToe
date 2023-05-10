//
//  GameScreenRouter.swift
//  TicTacToe
//
//  Created by Елена on 07.05.2023.
//

class GameScreenRouter {
    
    // MARK: - Private properties
    
    private var goToMainScreenHandler: (() -> Void)?
    
    
    // MARK: - Inits
    
    init(goToMainScreenHandler: (() -> Void)?) {
        self.goToMainScreenHandler = goToMainScreenHandler
    }
}


// MARK: - Public extensions

extension GameScreenRouter: GameScreenRouterProtocol {
    func goToMainScreen() {
        goToMainScreenHandler?()
    }
}
