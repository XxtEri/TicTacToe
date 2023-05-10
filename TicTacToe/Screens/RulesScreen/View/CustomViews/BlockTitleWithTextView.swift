//
//  BlockTitleWithTextView.swift
//  TicTacToe
//
//  Created by Елена on 08.05.2023.
//

import UIKit
import SnapKit

class BlockTitleWithTextView: UIView {
    
    // MARK: - Private properties
    
    private enum Metrics {
        static let titleTextSize: CGFloat = 16
        static let textTextSize: CGFloat = 13
        static let textTopOffset: CGFloat = 10
    }
    
    private var titleLabel: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.textAlignment = .left
        view.font = UIFont(name: FontTitle.zektonFont, size: Metrics.titleTextSize)
        
        
        return view
    }()
    
    private var textLabel: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.textAlignment = .left
        view.font = UIFont(name: FontTitle.zektonFont, size: Metrics.textTextSize)
        view.numberOfLines = .max
        
        return view
    }()
    
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("error")
    }
    
    
    // MARK: - Public methods
    
    func setTitle(title: String) {
        titleLabel.text = title
    }
    
    func setText(text: String) {
        textLabel.text = text
    }
}

// MARK: - Private extension
// MARK: - Setup

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
            make.top.equalTo(titleLabel.snp.bottom).offset(Metrics.textTopOffset)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
