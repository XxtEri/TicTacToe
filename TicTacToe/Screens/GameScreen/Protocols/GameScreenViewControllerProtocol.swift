//
//  GameScreenViewControllerProtocol.swift
//  TicTacToe
//
//  Created by Елена on 07.05.2023.
//

import Foundation

protocol GameScreenViewControllerProtocol: AnyObject {
    var presenter: GameScreenPresenterProtocol { get set }
    
    func addCrossImage(positionX: CGFloat, positionY: CGFloat)
    func addCircleImage(positionX: CGFloat, positionY: CGFloat)
    func finishGame(nameWinner: String)
    func finishGame()
}
