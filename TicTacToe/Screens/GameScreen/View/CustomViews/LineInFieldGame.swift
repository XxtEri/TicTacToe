//
//  LineInFieldGame.swift
//  TicTacToe
//
//  Created by Елена on 07.05.2023.
//

import UIKit

class LineInFieldGame: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.backgroundColor = .backgroundLineOnFieldGame
        self.layer.cornerRadius = 3
    }
}
