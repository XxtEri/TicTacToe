//
//  GameScreenPresenter.swift
//  TicTacToe
//
//  Created by Елена on 07.05.2023.
//

import CoreFoundation

class GameScreenPresenter {
    
    private enum Constants {
        static let countCellInRow: CGFloat = 3
        static let countCellInColumn: CGFloat = 3
    }
    
    var interactor: GameScreenInteractorProtocol
    var router: GameScreenRouterProtocol
    weak var view: GameScreenViewControllerProtocol?
    
    var nameCurrentPlayerTurning = Observable<String>()
    
    init(interactor: GameScreenInteractorProtocol, router: GameScreenRouterProtocol) {
        self.interactor = interactor
        self.router = router
        
        updateNameCurrentPlayerTurning()
    }
}

private extension GameScreenPresenter {
    func getInfoTappedCell(x: CGFloat, y: CGFloat, sizeFieldGame: CGFloat) -> (Int, Int) {
        let row = Int(y / (sizeFieldGame / Constants.countCellInRow)) + 1
        let column = Int(x / (sizeFieldGame / Constants.countCellInRow)) + 1
        
        return (row, column)
    }
    
    func addImage(positionX: CGFloat, positionY: CGFloat) {
        let currentShape = interactor.getCurrentPlayerShape()

        currentShape == .cross ? view?.addCrossImage(positionX: positionX, positionY: positionY) : view?.addCircleImage(positionX: positionX, positionY: positionY)
    }
}

extension GameScreenPresenter: GameScreenPresenterProtocol {
    func updateNameCurrentPlayerTurning() {
        nameCurrentPlayerTurning.updateModel(with: interactor.getNameCurrentPlayer())
    }
    
    func touchInGameField(x: CGFloat, y: CGFloat, sizeFieldGame: CGFloat) {
        let infoTappedCell = getInfoTappedCell(x: x, y: y, sizeFieldGame: sizeFieldGame)
        let row = infoTappedCell.0
        let column = infoTappedCell.1
        let centerFirstCell = (sizeFieldGame / 3) / 2
        
        let offsetX: CGFloat = {
            let column = CGFloat(infoTappedCell.1)
            switch column {
            case 1:
                return column
            case 2:
                return column + 1
            case 3:
                return column + 2
            default:
                return column
            }
        }()
        
        let offsetY: CGFloat = {
            let row = CGFloat(infoTappedCell.0)
            switch row {
            case 1:
                return row
            case 2:
                return row + 1
            case 3:
                return row + 2
            default:
                return row
            }
        }()
        
        let positionX = centerFirstCell * offsetX
        let positionY = centerFirstCell * offsetY
        
        if interactor.checkPossibleMoveInGame(row: row, column: column) {
            addImage(positionX: positionX, positionY: positionY)
            interactor.playerEndingTurn(row: row, column: column)
        }
    }
    
    func gameOverButtonTapped() {
        sendGameOver()
    }
    
    func sendGameOver(nameWinner: String) {
        view?.finishGame(nameWinner: nameWinner)
    }
    
    func sendGameOver() {
        view?.finishGame()
    }
    
    func goToMainScreen() {
        router.goToMainScreen()
    }
    
    func getNameCurrentUser() -> String {
        interactor.getNameCurrentPlayer()
    }
}
