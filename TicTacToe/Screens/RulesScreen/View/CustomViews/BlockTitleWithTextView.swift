//
//  BlockTitleWithTextView.swift
//  TicTacToe
//
//  Created by Елена on 08.05.2023.
//

import UIKit
import SnapKit

class BlockTitleWithTextView: UIView {
    
    private var titleLabel: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.textAlignment = .left
        view.font = UIFont(name: "Zekton", size: 16)
        
        
        return view
    }()
    
    private var textLabel: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.textAlignment = .left
        view.font = UIFont(name: "Zekton", size: 13)
        view.numberOfLines = .max
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("error")
    }
    
    func setTitle(title: String) {
        titleLabel.text = title
    }
    
    func setText(text: String) {
        textLabel.text = text
    }
}

private extension BlockTitleWithTextView {
    func setup() {
        addViews()
        configureConstraints()
    }
    
    func addViews() {
        self.addSubview(titleLabel)
        self.addSubview(textLabel)
    }
    
    func configureConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
        }
        
        textLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
