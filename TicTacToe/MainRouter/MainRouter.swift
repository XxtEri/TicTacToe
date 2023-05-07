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
        let startViewController = showGameScreen()
        let navigationController = UINavigationController(rootViewController: startViewController)
        
        self.navigationController = navigationController
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        return navigationController
    }
}

extension MainRouter {
    func showGameScreen() -> UIViewController {

        return GameScreenAssembly.build()
    }
}
