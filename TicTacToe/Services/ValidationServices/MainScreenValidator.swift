//
//  MainScreenValidator.swift
//  TicTacToe
//
//  Created by Елена on 08.05.2023.
//

import Foundation

enum MainScreenErrors: Error {
    case emptyFieldNamePlayer
    case notValidNamePlayer

    var localizedText: String {
        switch self {
        case .emptyFieldNamePlayer:
            return DescriptionError.emptyField
        case .notValidNamePlayer:
            return DescriptionError.notValidNamePlayer
        }
    }
}

class MainScreenValidator {
    
    // MARK: - Public methods
    
    func checkValidNamePlayers(nameFirstPlayer: String, nameSecondPlayer: String) throws {
        let nameEmptyPredicate = NSPredicate(format: RegexValidation.formatRegex, RegexValidation.regexEmptyString)
        
        if nameFirstPlayer.isEmpty || nameEmptyPredicate.evaluate(with: nameFirstPlayer) {
            throw MainScreenErrors.emptyFieldNamePlayer
        }
        
        if nameSecondPlayer.isEmpty || nameEmptyPredicate.evaluate(with: nameSecondPlayer) {
            throw MainScreenErrors.emptyFieldNamePlayer
        }
        
        let namePredicate = NSPredicate(format: RegexValidation.formatRegex, RegexValidation.regexNamePlayer)
        if !namePredicate.evaluate(with: nameFirstPlayer) ||
            !namePredicate.evaluate(with: nameSecondPlayer){
            
            throw MainScreenErrors.notValidNamePlayer
        }
    }
    
    func checkIsEmptyField(data: String) -> Bool {
        let nameEmptyPredicate = NSPredicate(format: RegexValidation.formatRegex, RegexValidation.regexEmptyString)
        
        if data.isEmpty || nameEmptyPredicate.evaluate(with: data) {
            return true
        }
        
        return false
    }
}
