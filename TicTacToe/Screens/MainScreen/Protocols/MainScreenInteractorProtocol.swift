//
//  MainScreenInteractorProtocol.swift
//  TicTacToe
//
//  Created by Елена on 08.05.2023.
//

protocol MainScreenInteractorProtocol {
    var presenter: MainScreenPresenterProtocol? { get set }
    
    func checkErrorValidData(firstPlayer: Player, secondPlayer: Player) throws -> Bool
    func checkValidData(firstPlayer: Player, secondPlayer: Player) throws -> Bool
    func sendErrorMessages(_ errorMessages: [String])
    func saveNamePlayers(nameFirstPlayer: String, nameSecondPlayer: String)
}
