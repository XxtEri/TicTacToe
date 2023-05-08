//
//  MainScreenRouter.swift
//  TicTacToe
//
//  Created by Елена on 08.05.2023.
//

import Foundation


class MainScreenRouter {
    private var goToGameScreenHandler: (() -> Void)?
    private var goToRulesScreenHandler: (() -> Void)?
    
    init(goToGameScreenHandler: (() -> Void)?, goToRulesScreenHandler: (() -> Void)?) {
        self.goToGameScreenHandler = goToGameScreenHandler
        self.goToRulesScreenHandler = goToRulesScreenHandler
    }
}

extension MainScreenRouter: MainScreenRouterProtocol {
    func goToRulesScreen() {
        self.goToRulesScreenHandler?()
    }
    
    func goToGameScreen() {
        self.goToGameScreenHandler?()
    }
}
