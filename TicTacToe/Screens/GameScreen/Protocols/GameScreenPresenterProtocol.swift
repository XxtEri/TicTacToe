//
//  GameScreenPresenterProtocol.swift
//  TicTacToe
//
//  Created by Елена on 07.05.2023.
//

import Foundation

protocol GameScreenPresenterProtocol: AnyObject {
    var view: GameScreenViewControllerProtocol? { get set }
    var interactor: GameScreenInteractorProtocol { get set }
    var router: GameScreenRouterProtocol { get set }
    
    func touchInGameField(x: CGFloat, y: CGFloat, sizeFieldGame: CGFloat)
    func addImage(positionX: CGFloat, positionY: CGFloat)
    func sendGameOver(nameWinner: String)
    func sendGameOver()
    func goToMainScreen()
    func getNameCurrentUser() -> String
}
