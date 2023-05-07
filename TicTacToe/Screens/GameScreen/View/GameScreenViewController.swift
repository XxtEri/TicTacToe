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
}
