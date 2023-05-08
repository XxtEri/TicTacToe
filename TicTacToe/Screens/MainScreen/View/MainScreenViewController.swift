//
//  MainScreenViewController.swift
//  TicTacToe
//
//  Created by Елена on 08.05.2023.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    private var ui: MainScreenView
    var presenter: MainScreenPresenterProtocol
    
    init(presenter: MainScreenPresenterProtocol) {
        self.presenter = presenter
        ui = MainScreenView()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("error")
    }
    
    override func loadView() {
        self.view = ui
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupToHideKeyboardOnTapOnView()
        handler()
    }
    
    private func handler() {
        ui.startGameButtonTappedHandler = { [ weak self ] (firstPlayer, secondPlayer)  in
            guard let self = self else { return }
            
            self.presenter.startGameButtonTapped(firstPlayer: firstPlayer, secondPlayer: secondPlayer)
        }
    }
}

private extension MainScreenViewController {
    func setupToHideKeyboardOnTapOnView() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        
        self.view.addGestureRecognizer(tap)
    }
    
    @objc
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
}

extension MainScreenViewController: MainScreenViewControllerProtocol {
    func setEnabledButton(enabled: Bool) {
        ui.setEnabledStarGameButton(enabled: enabled)
    }
    
    func showErrorMessages(_ errorMessages: [String]) {
        var errors = String()
        
        errorMessages.forEach { message in
            errors.append("\n" + message + "\n")
        }
        
        let alertController = UIAlertController(title: "Внимание!", message: errors, preferredStyle: .alert)
        let action = UIAlertAction(title: "Закрыть", style: .cancel) { [ weak self ] action in
            guard let self = self else { return }
            
            self.setEnabledButton(enabled: true)
        }
        
        alertController.addAction(action)
        alertController.view.tintColor = .accentColorApplication
        
        self.present(alertController, animated: true, completion: nil)
    }
}
