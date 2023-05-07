//
//  GameScreenInteractor.swift
//  TicTacToe
//
//  Created by Елена on 07.05.2023.
//

final class GameScreenInteractor {
    weak var presenter: GameScreenPresenterProtocol?
    
    var nameFirstPlayer: String
    var nameSecondPlayer: String
    var nowTurnPlayerShape: PlayerShapeType
    var gameMatrix = [[PlayerShapeType]]()
    
    init() {
        nameFirstPlayer = "Nana"
        nameSecondPlayer = "Bla"
        nowTurnPlayerShape = .cross
        
        for _ in 0..<9 {
            var array = [PlayerShapeType]()
            for _ in 0..<9 {
                array.append(PlayerShapeType.non)
            }
            
            gameMatrix.append(array)
        }
    }
}

extension GameScreenInteractor: GameScreenInteractorProtocol {
    func saveNewShape(row: Int, column: Int) {
        gameMatrix[row][column] = nowTurnPlayerShape
    }
    
    func moveToNextPlayer() {
        nowTurnPlayerShape = nowTurnPlayerShape == .cross ? .circle : .cross
    }
    
    func checkPossibleMoveInGame(row: Int, column: Int) -> Bool {
        gameMatrix[row][column] == .non ? true : false
    }
    
    func getCurrentPlayerShape() -> PlayerShapeType {
        nowTurnPlayerShape
    }
    
    func getNameCurrentPlayer() -> String {
        nowTurnPlayerShape == .cross ? nameFirstPlayer : nameSecondPlayer
    }
}
