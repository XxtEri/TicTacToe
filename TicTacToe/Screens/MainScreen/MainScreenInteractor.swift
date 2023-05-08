//
//  MainScreenInteractor.swift
//  TicTacToe
//
//  Created by Елена on 08.05.2023.
//

import Foundation

class MainScreenInteractor {
    private var validator: MainScreenValidator
    weak var presenter: MainScreenPresenterProtocol?
    
    init() {
        validator = MainScreenValidator()
    }
}

extension MainScreenInteractor: MainScreenInteractorProtocol {
    func checkErrorValidData(firstPlayer: Player, secondPlayer: Player) throws -> Bool {
        var errorMessages = [String]()
        
        do {
            try validator.checkValidNamePlayers(nameFirstPlayer: firstPlayer.name, nameSecondPlayer: secondPlayer.name)
            
        } catch MainScreenErrors.emptyFieldNamePlayer {
            errorMessages.append(MainScreenErrors.emptyFieldNamePlayer.rawValue)
            
        } catch MainScreenErrors.notValidNamePlayer {
            errorMessages.append(MainScreenErrors.notValidNamePlayer.rawValue)
        }
        
        if !errorMessages.isEmpty {
            sendErrorMessages(errorMessages)
            return true
        }
        
        return false
    }
    
    func checkValidData(firstPlayer: Player, secondPlayer: Player) throws -> Bool {
        do {
            try validator.checkValidNamePlayers(nameFirstPlayer: firstPlayer.name, nameSecondPlayer: secondPlayer.name)
            
        } catch MainScreenErrors.emptyFieldNamePlayer {
            return false
        }
         
        return true
    }
    
    func sendErrorMessages(_ errorMessages: [String]) {
        presenter?.sendErrorMessages(errorMessages)
    }
}
