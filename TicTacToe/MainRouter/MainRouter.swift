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
            guard let self = self else { return }
            
            self.showRulesScreen()
        }
        
        let parameters = MainScreenAssembly.Parameters(goToGameScreenHandler: goToGameScreenHandler,
                                                       goToRulesScreenHandler: goToRulesScreenHandler)
        
        return MainScreenAssembly.build(with: parameters)
    }
    
    func showMainScreen() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func showGameScreen() {
        let goToMainScreenHandler = { [ weak self ] in
            guard let self = self else { return }
            
            self.showMainScreen()
        }
        
        let parameters = GameScreenAssembly.Parameters(goToMainScreenHandler: goToMainScreenHandler)
        let viewController = GameScreenAssembly.build(with: parameters)
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func showRulesScreen() {
        let goToMainScreenHandler = { [ weak self ] in
            guard let self = self else { return }
            
            self.showMainScreen()
        }
        
        let parameters = RulesScreenAssembly.Parameters(goToMainScreenHandler: goToMainScreenHandler)
        let viewController = RulesScreenAssembly.build(with: parameters)
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
