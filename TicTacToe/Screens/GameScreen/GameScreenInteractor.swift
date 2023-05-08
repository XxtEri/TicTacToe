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
        nameFirstPlayer = UserDefaults.standard.string(forKey: "nameFirstPlayer") ?? "First player"
        nameSecondPlayer = UserDefaults.standard.string(forKey: "nameSecondPlayer") ?? "Second player"
        
        handler()
    }
    
    private func handler() {
        businessLogic.gameOverWinHandler = { [ weak self ] winPlayerShape in
            guard let self = self else { return }
            
            self.sendGameOver(playerShape: winPlayerShape)
        }
        
        businessLogic.gameOverDrawHandler = { [ weak self ] in
            guard let self = self else { return }
            
            self.sendGameOver()
        }
    }
}

private extension GameScreenInteractor {
    func saveNewShape(row: Int, column: Int) {
        businessLogic.saveNewShape(row: row, column: column)
    }
    
    func moveToNextPlayer() {
        businessLogic.changeCurrentPlayer()
    }
}

extension GameScreenInteractor: GameScreenInteractorProtocol {
    func playerEndingTurn(row: Int, column: Int) {
        saveNewShape(row: row, column: column)
        moveToNextPlayer()
        
        if !businessLogic.checkPresenseWinnerPosition() {
            presenter?.updateNameCurrentPlayerTurning()
        }
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
    
    func sendGameOver(playerShape: PlayerShapeType) {
        let nameWinner = playerShape == .cross ? nameFirstPlayer : nameSecondPlayer
        presenter?.sendGameOver(nameWinner: nameWinner)
    }
    
    func sendGameOver() {
        presenter?.sendGameOver()
    }
    
    func clearData() {
        UserDefaults.standard.removeObject(forKey: "nameFirstPlayer")
        UserDefaults.standard.removeObject(forKey: "nameSecondPlayer")
    }
}
