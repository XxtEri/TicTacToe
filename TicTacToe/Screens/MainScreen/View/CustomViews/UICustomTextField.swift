//
//  UICustomTextField.swift
//  TicTacToe
//
//  Created by Елена on 08.05.2023.
//

import UIKit

class UICustomTextField: UITextField {
    
    // MARK: Private properties
    
    private enum Metrics {
        static let testSize: CGFloat = 14
        static let cornerRadius: CGFloat = 2
        static let borderWidth: CGFloat = 2
        
        static let topInset: CGFloat = 13
        static let bottomInset: CGFloat = 13
        static let leadingInset: CGFloat = 13
        static let trailingInset: CGFloat = 13
    }
    
    //- MARK: Public properties
    
    var padding = UIEdgeInsets(top: Metrics.topInset,
                               left: Metrics.leadingInset,
                               bottom: Metrics.bottomInset,
                               right: Metrics.trailingInset)
    
    
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
        view.font = UIFont(name: FontTitle.zektonFont, size: Metrics.testSize)
        
        view.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.placeholderText])
        
        view.layer.cornerRadius = Metrics.cornerRadius
        view.layer.borderWidth = Metrics.borderWidth
        view.layer.borderColor = UIColor.borderTextField.cgColor
        
        return view
    }
}

