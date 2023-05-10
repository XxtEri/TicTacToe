//
//  MainScreenRouter.swift
//  TicTacToe
//
//  Created by Елена on 08.05.2023.
//

import Foundation


class MainScreenRouter {
    
    // MARK: - Private properties
    
    private var goToGameScreenHandler: ((String, String) -> Void)?
    private var goToRulesScreenHandler: (() -> Void)?
    
    
    // MARK: - Inits
    
    init(goToGameScreenHandler: ((String, String) -> Void)?, goToRulesScreenHandler: (() -> Void)?) {
        self.goToGameScreenHandler = goToGameScreenHandler
        self.goToRulesScreenHandler = goToRulesScreenHandler
    }
}


// MARK: - Public extension

extension MainScreenRouter: MainScreenRouterProtocol {
    func goToRulesScreen() {
        self.goToRulesScreenHandler?()
    }
    
    func goToGameScreen(nameFirstPlayer: String, nameSecondPlayer: String) {
        self.goToGameScreenHandler?(nameFirstPlayer, nameSecondPlayer)
    }
}
