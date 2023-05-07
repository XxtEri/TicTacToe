//
//  GameScreenView.swift
//  TicTacToe
//
//  Created by Елена on 07.05.2023.
//

import UIKit
import SnapKit

class GameScreenView: UIView {
    
    private var nameTurnPayerLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Zekton", size: 25)
        view.textColor = .white
        view.textAlignment = .center
        
        return view
    }()
    
    private var gameOverButton: UIButton = {
        let view = UIButton()
        view.setTitle("Finish the game", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.textAlignment = .center
        view.titleLabel?.font = UIFont(name: "Zekton", size: 20)
        view.backgroundColor = .backgroundGameOverButton
        view.layer.cornerRadius = 5
        view.contentEdgeInsets = UIEdgeInsets(top: 13, left: 10, bottom: 13, right: 10)
        
        return view
    }()
    
    var fieldGameView = FieldGameView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setNamePlayerLabel(name: String) {
        nameTurnPayerLabel.text = "\(name) turn now"
    }
}

private extension GameScreenView {
    func setup() {
        addViews()
        configureUI()
        configureConstraints()
        configureActions()
    }
    
    func configureUI() {
        self.backgroundColor = .black
    }
    
    func addViews() {
        self.addSubview(nameTurnPayerLabel)
        self.addSubview(fieldGameView)
        self.addSubview(gameOverButton)
    }
    
    func configureConstraints() {
        nameTurnPayerLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).inset(35)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        fieldGameView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        gameOverButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(24)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(10)
        }
    }
    
    func configureActions() {
        
    }
}
