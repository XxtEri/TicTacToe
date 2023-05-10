//
//  RulesScreenPresenterProtocol.swift
//  TicTacToe
//
//  Created by Елена on 08.05.2023.
//

protocol RulesScreenPresenterProtocol: AnyObject {
    var view: RulesScreenViewControllerProtocol? { get set }
    var router: RulesScreenRouterProtocol { get set }
    
    func backToMainScreen()
}
