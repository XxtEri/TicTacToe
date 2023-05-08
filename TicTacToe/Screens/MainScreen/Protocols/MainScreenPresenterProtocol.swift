//
//  MainScreenPresenterProtocol.swift
//  TicTacToe
//
//  Created by Елена on 08.05.2023.
//

protocol MainScreenPresenterProtocol: AnyObject {
    var view: MainScreenViewControllerProtocol? { get set }
    var interactor: MainScreenInteractorProtocol { get set }
    var router: MainScreenRouterProtocol { get set }
}
