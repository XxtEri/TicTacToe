//
//  InputBlockView.swift
//  TicTacToe
//
//  Created by Елена on 08.05.2023.
//

import SnapKit
import UIKit

class InputBlockView: UIView {

    private var titleInputBlock: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = UIFont(name: "Zekton", size: 16)
        view.textAlignment = .left
        
        return view
    }()

    private var inputField: UICustomTextField = {
        var view = UICustomTextField()
        view = view.getCustomTextField(placeholder: "Введите имя")
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder){
        fatalError("error")
    }
    
    private func setup() {
        self.addSubview(titleInputBlock)
        self.addSubview(inputField)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        titleInputBlock.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        inputField.snp.makeConstraints { make in
            make.top.equalTo(titleInputBlock.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func setTitleInputBlock(title: String) {
        titleInputBlock.text = title
    }
    
    func getNamePlayer() -> String {
        inputField.text ?? ""
    }
}
