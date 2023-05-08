//
//  RulesScreenViewController.swift
//  TicTacToe
//
//  Created by Елена on 08.05.2023.
//

import UIKit

class RulesScreenViewController: UIViewController {
    
    private var ui: RulesScreenView
    
    var presenter: RulesScreenPresenterProtocol
    
    init(presenter: RulesScreenPresenterProtocol) {
        self.presenter = presenter
        ui = RulesScreenView()
        
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
        
        handler()
    }
    
    private func handler() {
        ui.arrowBackTappedHandler = { [ weak self ] in
            guard let self = self else { return }
            
            self.presenter.backToMainScreen()
        }
    }
}

extension RulesScreenViewController: RulesScreenViewControllerProtocol {
    
}
