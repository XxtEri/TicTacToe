//
//  RulesScreenViewController.swift
//  TicTacToe
//
//  Created by Елена on 08.05.2023.
//

import UIKit

class RulesScreenViewController: UIViewController, RulesScreenViewControllerProtocol {
    
    // MARK: - Private properties
    
    private var ui: RulesScreenView
    
    
    // MARK: - Public properties
    
    var presenter: RulesScreenPresenterProtocol
    
    
    // MARK: - Inits
    
    init(presenter: RulesScreenPresenterProtocol) {
        self.presenter = presenter
        ui = RulesScreenView()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("error")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        self.view = ui
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        handler()
    }
    
    
    // MARK: - Private methods
    
    private func handler() {
        ui.arrowBackTappedHandler = { [ weak self ] in
            guard let self = self else { return }
            
            self.presenter.backToMainScreen()
        }
    }
}
