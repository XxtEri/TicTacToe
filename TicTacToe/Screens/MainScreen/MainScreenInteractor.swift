//
//  MainScreenInteractor.swift
//  TicTacToe
//
//  Created by Елена on 08.05.2023.
//

import Foundation

class MainScreenInteractor {
    
    // MARK: - Private properties
    
    private var validator: MainScreenValidator
    
    
    // MARK: - Public properties
    
    weak var presenter: MainScreenPresenterProtocol?
    
    
    // MARK: - Inits
    
    init() {
        validator = MainScreenValidator()
    }
}


// MARK: - Public extension

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
    
    func checkValidData(firstPlayer: Player, secondPlayer: Player) -> Bool {
        if validator.checkIsEmptyField(data: firstPlayer.name) || validator.checkIsEmptyField(data: secondPlayer.name) {
            return false
        }
         
        return true
    }
    
    func sendErrorMessages(_ errorMessages: [String]) {
        presenter?.sendErrorMessages(errorMessages)
    }
}
