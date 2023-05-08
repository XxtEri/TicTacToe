//
//  ViewController.swift
//  TicTacToe
//
//  Created by Елена on 07.05.2023.
//

import UIKit

class GameScreenViewController: UIViewController {
    
    private var ui: GameScreenView
    var presenter: GameScreenPresenterProtocol
    
    init(presenter: GameScreenPresenterProtocol) {
        self.presenter = presenter
        ui = GameScreenView()
        
        super.init(nibName: nil, bundle: nil)
        
        ui.setNamePlayerLabel(name: presenter.getNameCurrentUser())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = ui
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        handler()
    }
}

private extension GameScreenViewController {
    func handler() {
        ui.fieldGameView.fieldGameTapped = { [ weak self ] (x, y, sizeFieldGame) in
            guard let self = self else { return }
            
            self.presenter.touchInGameField(x: x, y: y, sizeFieldGame: sizeFieldGame)
        }
    }
    
    func showAlert(title: String, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.editButtonItem.tintColor = .accentColorApplication
        
        let alertActionGoToStartScreen = UIAlertAction(title: "Вернуться на главную", style: .default) { [ weak self ]_ in
            guard let self = self else { return }
            
            self.presenter.goToMainScreen()
        }

        alert.addAction(alertActionGoToStartScreen)
        
        self.present(alert, animated: true)
    }
}

extension GameScreenViewController: GameScreenViewControllerProtocol {
    func addCrossImage(positionX: CGFloat, positionY: CGFloat) {
        ui.fieldGameView.addCrossImage(positionX: positionX, positionY: positionY)
    }
    
    func addCircleImage(positionX: CGFloat, positionY: CGFloat) {
        ui.fieldGameView.addCircleImage(positionX: positionX, positionY: positionY)
    }
    
    func changeNameLabel(nameCurrentPlayer: String) {
        ui.setNamePlayerLabel(name: nameCurrentPlayer)
    }
    
    func finishGame(nameWinner: String) {
        showAlert(title: "Игра окончена", message: "Победитель \(nameWinner)")
    }
    
    func finishGame() {
        showAlert(title: "Игра окончена", message: "Объявлена ничья")
    }
}
