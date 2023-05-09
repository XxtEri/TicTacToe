//
//  GameScreenView.swift
//  TicTacToe
//
//  Created by Елена on 07.05.2023.
//

import UIKit
import SnapKit

class GameScreenView: UIView {
    
    // MARK: - Private properties
    
    private var infoWhoTurnNow: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 2
        
        return view
    }()
    
    private var nameTurnPayerLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Zekton", size: 25)
        view.textColor = .white
        view.textAlignment = .center
        view.numberOfLines = 2
        
        return view
    }()
    
    private var turnNowTextLabel: UILabel = {
        let view = UILabel()
        view.text = "ходит сейчас"
        view.font = UIFont(name: "Zekton", size: 25)
        view.textColor = .white
        view.textAlignment = .center
        view.numberOfLines = 1
        
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
    
    // MARK: - Handlers
    
    var fieldGameView = FieldGameView()
    var gameOverButtonTappedHandler: (() -> Void)?
    
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Public methods
    
    func setNamePlayerLabel(name: String) {
        nameTurnPayerLabel.text = name
    }
}


// MARK: - Private extensions

// MARK: - Setup

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
        self.addSubview(infoWhoTurnNow)
        self.addSubview(fieldGameView)
        self.addSubview(gameOverButton)
        
        infoWhoTurnNow.addArrangedSubview(nameTurnPayerLabel)
        infoWhoTurnNow.addArrangedSubview(turnNowTextLabel)
    }
    
    func configureConstraints() {
        infoWhoTurnNow.snp.makeConstraints { make in
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
        gameOverButton.addTarget(self, action: #selector(gameOverButtonTapped), for: .touchUpInside)
    }
}

// MARK: - Actions

private extension GameScreenView {
    
    @objc
    func gameOverButtonTapped() {
        gameOverButtonTappedHandler?()
    }
}
