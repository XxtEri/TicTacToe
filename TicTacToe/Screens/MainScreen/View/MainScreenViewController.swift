//
//  MainScreenViewController.swift
//  TicTacToe
//
//  Created by Елена on 08.05.2023.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    // MARK: - Private properties
    
    private var ui: MainScreenView
    
    
    // MARK: - Public properties
    
    var presenter: MainScreenPresenterProtocol
    
    
    // MARK: - Inits
    
    init(presenter: MainScreenPresenterProtocol) {
        self.presenter = presenter
        ui = MainScreenView()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("error")
    }
    
    
    // MARK: - Lifecycle
    
    override func loadView() {
        self.view = ui
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.presenter.checkValidData(firstPlayer: Player(name: ui.getNameFirstPlayer()),
                                 secondPlayer: Player(name: ui.getNameSecondPlayer()))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupToHideKeyboardOnTapOnView()
        handler()
    }
    
    // MARK: - Private methods

    private func handler() {
        ui.startGameButtonTappedHandler = { [ weak self ] (firstPlayer, secondPlayer)  in
            guard let self = self else { return }
            
            self.presenter.startGameButtonTapped(firstPlayer: firstPlayer, secondPlayer: secondPlayer)
        }
        
        ui.editNamesHandler = { [ weak self ] (firstPlayer, secondPlayer) in
            guard let self = self else { return }
            
            self.presenter.checkValidData(firstPlayer: firstPlayer, secondPlayer: secondPlayer)
        }
        
        ui.rulesLabelTappedHandler = { [ weak self ] in
            guard let self = self else { return }
            
            self.presenter.router.goToRulesScreen()
        }
    }
}


// MARK: - Private extension

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


// MARK: - Public extension

extension MainScreenViewController: MainScreenViewControllerProtocol {
    func changeLayoutAuthButton(isValidData: Bool) {
        ui.changeLayoutAuthButton(isValidData: isValidData)
    }
    
    func setEnabledButton(enabled: Bool) {
        ui.setEnabledStarGameButton(enabled: enabled)
    }
    
    func showErrorMessages(_ errorMessages: [String]) {
        var errors = String()
        
        errorMessages.forEach { message in
            errors.append("\n" + message + "\n")
        }
        
        let alertController = UIAlertController(title: StringConstants.titleAlertWithErrorMessage, message: errors, preferredStyle: .alert)
        let action = UIAlertAction(title: StringConstants.titleButtonCancelOfAlert, style: .cancel) { [ weak self ] action in
            guard let self = self else { return }
            
            self.setEnabledButton(enabled: true)
        }
        
        alertController.addAction(action)
        alertController.view.tintColor = .accentColorApplication
        
        self.present(alertController, animated: true, completion: nil)
    }
}
