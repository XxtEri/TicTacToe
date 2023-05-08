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
    
}
