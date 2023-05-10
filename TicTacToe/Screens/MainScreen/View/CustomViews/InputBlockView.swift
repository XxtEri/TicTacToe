//
//  InputBlockView.swift
//  TicTacToe
//
//  Created by Елена on 08.05.2023.
//

import SnapKit
import UIKit

class InputBlockView: UIView {
    
    // MARK: - Private properties
    
    private enum Metrics {
        static let titleInputBlockTextSize: CGFloat = 16
        
        static let inputFieldTopOffset: CGFloat = 10
    }

    private var titleInputBlock: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = UIFont(name: FontTitle.zektonFont, size: Metrics.titleInputBlockTextSize)
        view.textAlignment = .left
        
        return view
    }()
    
    
    // MARK: - Public poperties

    var inputField: UICustomTextField = {
        var view = UICustomTextField()
        view = view.getCustomTextField(placeholder: StringConstants.inputFieldPlaceholderText)
        
        return view
    }()
    
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder){
        fatalError("error")
    }
    
    
    // MARK: - Public methods
    
    func setTitleInputBlock(title: String) {
        titleInputBlock.text = title
    }
    
    func getNamePlayer() -> String {
        inputField.text ?? String()
    }
}


// MARK: - Private extension

private extension InputBlockView {
    func setup() {
        addViews()
        configureConstraints()
    }
    
    func addViews() {
        self.addSubview(titleInputBlock)
        self.addSubview(inputField)
    }
    
    func configureConstraints() {
        titleInputBlock.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        inputField.snp.makeConstraints { make in
            make.top.equalTo(titleInputBlock.snp.bottom).offset(Metrics.inputFieldTopOffset)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
