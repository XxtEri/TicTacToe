//
//  MainRouter.swift
//  TicTacToe
//
//  Created by Елена on 07.05.2023.
//

import UIKit

class MainRouter: MainRouterProtocol {
    internal var navigationController: UINavigationController?
    
    func start() -> UINavigationController {
        let startViewController = getStartScreen()
        let navigationController = UINavigationController(rootViewController: startViewController)
        
        self.navigationController = navigationController
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        return navigationController
    }
}

extension MainRouter {
    func getStartScreen() -> UIViewController {
        let goToGameScreenHandler = { [ weak self ] in
            guard let self = self else { return }
            
            self.showGameScreen()
        }
        
        let goToRulesScreenHandler = { [ weak self ] in
            //TODO: добавить функцию для перехода на экран с правилами игры
        }
        
        let parameters = MainScreenAssembly.Parameters(goToGameScreenHandler: goToGameScreenHandler,
                                                       goToRulesScreenHandler: goToRulesScreenHandler)
        
        return MainScreenAssembly.build(with: parameters)
    }
    
    func showMainScreen() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func showGameScreen() {
        let viewController = GameScreenAssembly.build()
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
