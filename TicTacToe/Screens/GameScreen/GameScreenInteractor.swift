//
//  GameScreenInteractor.swift
//  TicTacToe
//
//  Created by Елена on 07.05.2023.
//

import Foundation

final class GameScreenInteractor {
    weak var presenter: GameScreenPresenterProtocol?
    var businessLogic: GameBusinessLogic
    
    var nameFirstPlayer: String
    var nameSecondPlayer: String
    
    init() {
        businessLogic = GameBusinessLogic()
        nameFirstPlayer = "Nana"
        nameSecondPlayer = "Bla"
    }
}

extension GameScreenInteractor: GameScreenInteractorProtocol {
    func saveNewShape(row: Int, column: Int) {
        businessLogic.saveNewShape(row: row, column: column)
    }
    
    func moveToNextPlayer() {
        businessLogic.changeCurrentPlayer()
    }
    
    func checkPossibleMoveInGame(row: Int, column: Int) -> Bool {
        businessLogic.checkPossibleMoveInGame(row: row, column: column)
    }
    
    func getCurrentPlayerShape() -> PlayerShapeType {
        businessLogic.getCurrentPlayerShape()
    }
    
    func getNameCurrentPlayer() -> String {
        businessLogic.getCurrentPlayerShape() == .cross ? nameFirstPlayer : nameSecondPlayer
    }
    
    func checkIfGameOver() -> Bool {
        businessLogic.checkPresenseNonShape()
    }
}
