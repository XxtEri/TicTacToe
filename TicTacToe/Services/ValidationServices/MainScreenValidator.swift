//
//  MainScreenValidator.swift
//  TicTacToe
//
//  Created by Елена on 08.05.2023.
//

import Foundation

enum MainScreenErrors: String, Error {
    case emptyFieldNamePlayer = "Заполните все поля с именами игроков и повторите попытку"
    case notValidNamePlayer = "Имена игроков должны состоять только из букв английского или русского алфавита"
}

class MainScreenValidator {
    
    // MARK: - Public methods
    
    func checkValidNamePlayers(nameFirstPlayer: String, nameSecondPlayer: String) throws {
        let nameEmptyPredicate = NSPredicate(format: "SELF MATCHES %@", "^[ ]+$")
        
        if nameFirstPlayer.isEmpty || nameEmptyPredicate.evaluate(with: nameFirstPlayer) {
            throw MainScreenErrors.emptyFieldNamePlayer
        }
        
        if nameSecondPlayer.isEmpty || nameSecondPlayer.contains("[ ]+") {
            throw MainScreenErrors.emptyFieldNamePlayer
        }
        
        let namePredicate = NSPredicate(format: "SELF MATCHES %@", "^[A-Za-zA-Яа-я0-9 ]{1,}$")
        if !namePredicate.evaluate(with: nameFirstPlayer) ||
            !namePredicate.evaluate(with: nameSecondPlayer){
            
            throw MainScreenErrors.notValidNamePlayer
        }
    }
}
