//
//  UICustomTextField.swift
//  TicTacToe
//
//  Created by Елена on 08.05.2023.
//

import UIKit

class UICustomTextField: UITextField {
    
    //- MARK: Public properties
    
    var padding = UIEdgeInsets(top: 13, left: 16, bottom: 13, right: 16)
    
    
    //- MARK: Override methods
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    
    //- MARK: Public methods
    
    func getCustomTextField(placeholder: String) -> UICustomTextField {
        
        let view = UICustomTextField()
        view.textColor = .white
        view.font = UIFont(name: "Zekton", size: 14)
        
        view.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.placeholderText])
        
        view.layer.cornerRadius = 2
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.borderTextField.cgColor
        
        return view
    }
}

