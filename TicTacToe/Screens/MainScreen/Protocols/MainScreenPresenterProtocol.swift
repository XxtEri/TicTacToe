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
    
    func startGameButtonTapped(firstPlayer: Player, secondPlayer: Player)
    func sendErrorMessages(_ errorMessages: [String])
    func checkValidData(firstPlayer: Player, secondPlayer: Player)
}
