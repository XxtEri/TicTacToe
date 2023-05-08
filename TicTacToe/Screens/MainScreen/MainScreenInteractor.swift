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
    
    func checkValidData(firstPlayer: Player, secondPlayer: Player) -> Bool {
        let nameEmptyPredicate = NSPredicate(format: "SELF MATCHES %@", "^[ ]+$")
        
        if firstPlayer.name.isEmpty ||
            secondPlayer.name.isEmpty ||
            nameEmptyPredicate.evaluate(with: firstPlayer.name) ||
            nameEmptyPredicate.evaluate(with: secondPlayer.name) {
            
            return false
        }
         
        return true
    }
    
    func saveNamePlayers(nameFirstPlayer: String, nameSecondPlayer: String) {
        UserDefaults.standard.set(nameFirstPlayer, forKey: "nameFirstPlayer")
        UserDefaults.standard.set(nameSecondPlayer, forKey: "nameSecondPlayer")
    }
    
    func sendErrorMessages(_ errorMessages: [String]) {
        presenter?.sendErrorMessages(errorMessages)
    }
}
