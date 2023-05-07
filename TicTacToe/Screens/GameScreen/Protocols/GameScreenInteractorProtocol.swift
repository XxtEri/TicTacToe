//
//  GameScreenInteractorProtocol.swift
//  TicTacToe
//
//  Created by Елена on 07.05.2023.
//

protocol GameScreenInteractorProtocol {
    var presenter: GameScreenPresenterProtocol? { get set }
    
    func playerEndingTurn(row: Int, column: Int)
    func checkPossibleMoveInGame(row: Int, column: Int) -> Bool
    func getCurrentPlayerShape() -> PlayerShapeType
    func getNameCurrentPlayer() -> String
    func sendGameOver(playerShape: PlayerShapeType)
    func sendGameOver()
}
