//
//  MainScreenPresenter.swift
//  TicTacToe
//
//  Created by Елена on 08.05.2023.
//

import Foundation

class MainScreenPresenter {
    
    // MARK: - Public properties
    
    weak var view: MainScreenViewControllerProtocol?
    var interactor: MainScreenInteractorProtocol
    var router: MainScreenRouterProtocol
    
    
    // MARK: - Inits
    
    init(interactor: MainScreenInteractorProtocol, router: MainScreenRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

// MARK: - Public extension

extension MainScreenPresenter: MainScreenPresenterProtocol {
    func startGameButtonTapped(firstPlayer: Player, secondPlayer: Player) {
        view?.setEnabledButton(enabled: false)
        
        guard let checkError = try? interactor.checkErrorValidData(firstPlayer: firstPlayer, secondPlayer: secondPlayer) else { return }
        
        if !checkError {
            router.goToGameScreen(nameFirstPlayer: firstPlayer.name, nameSecondPlayer: secondPlayer.name)
        }
    }
    
    func rulesLabelTapped() {
        router.goToRulesScreen()
    }
    
    func checkValidData(firstPlayer: Player, secondPlayer: Player) {
        guard let dataIsEmpty = try? interactor.checkValidData(firstPlayer: firstPlayer, secondPlayer: secondPlayer) else { return }
        
        view?.setEnabledButton(enabled: dataIsEmpty)
        view?.changeLayoutAuthButton(isValidData: dataIsEmpty)
    }
    
    func sendErrorMessages(_ errorMessages: [String]) {
        view?.showErrorMessages(errorMessages)
    }
}
