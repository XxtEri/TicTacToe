//
//  RulesScreenAssembly.swift
//  TicTacToe
//
//  Created by Елена on 08.05.2023.
//

import UIKit

enum RulesScreenAssembly {
    
    // MARK: - Parameters screen
    
    struct Parameters {        
        let goToMainScreenHandler: (() -> Void)
    }
    
    // MARK: - Build method
    
    static func build(with parameters: Parameters) -> UIViewController {
        let router = RulesScreenRouter(goToMainScreenHandler: parameters.goToMainScreenHandler)
        let presenter = RulesScreenPresenter(router: router)
        let viewController = RulesScreenViewController(presenter: presenter)
        
        presenter.view = viewController
        
        return viewController
    }
}
