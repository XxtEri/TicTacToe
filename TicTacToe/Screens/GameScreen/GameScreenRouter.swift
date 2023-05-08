//
//  GameScreenRouter.swift
//  TicTacToe
//
//  Created by Елена on 07.05.2023.
//

class GameScreenRouter {
    private var goToMainScreenHandler: (() -> Void)?
    
    init(goToMainScreenHandler: (() -> Void)?) {
        self.goToMainScreenHandler = goToMainScreenHandler
    }
}

extension GameScreenRouter: GameScreenRouterProtocol {
    func goToMainScreen() {
        goToMainScreenHandler?()
    }
}
