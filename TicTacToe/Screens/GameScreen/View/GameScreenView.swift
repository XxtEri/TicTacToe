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
    
    private enum Metrics {
        static let infoWhoTurnNowStackSpacing: CGFloat = 2
        static let infoWhoTurnNowStackTopInset: CGFloat = 35
        static let infoWhoTurnNowStackHorizontalInset: CGFloat = 16
        
        static let fieldGameViewHorizontalInset: CGFloat = 24
        
        static let nameTurnPayerTextSize: CGFloat = 25
        static let nameTurnPayerNumbersOfLine = 2
        
        static let turnNowTextTextSize: CGFloat = 25
        static let turnNowTextNumbersOfLine = 1
        
        static let gameOverButtonTextSize: CGFloat = 20
        static let gameOverButtonCornerRadius: CGFloat = 5
        static let gameOverButtonEdgeInsets = UIEdgeInsets(top: 13, left: 10, bottom: 13, right: 10)
        static let gameOverButtonHorizontalInset: CGFloat = 24
        static let gameOverButtonBottomInset: CGFloat = 10
    }
    
    private var infoWhoTurnNowStack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = Metrics.infoWhoTurnNowStackSpacing
        
        return view
    }()
    
    private var nameTurnPayerLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: FontTitle.zektonFont, size: Metrics.nameTurnPayerTextSize)
        view.textColor = .white
        view.textAlignment = .center
        view.numberOfLines = Metrics.nameTurnPayerNumbersOfLine
        
        return view
    }()
    
    private var turnNowTextLabel: UILabel = {
        let view = UILabel()
        view.text = StringConstants.turnNowText
        view.font = UIFont(name: FontTitle.zektonFont, size: Metrics.turnNowTextTextSize)
        view.textColor = .white
        view.textAlignment = .center
        view.numberOfLines = Metrics.turnNowTextNumbersOfLine
        
        return view
    }()
    
    private var gameOverButton: UIButton = {
        let view = UIButton()
        view.setTitle(StringConstants.titleStopGameButton, for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.textAlignment = .center
        view.titleLabel?.font = UIFont(name: FontTitle.zektonFont, size: Metrics.gameOverButtonTextSize)
        view.backgroundColor = .backgroundGameOverButton
        view.layer.cornerRadius = Metrics.gameOverButtonCornerRadius
        view.contentEdgeInsets = Metrics.gameOverButtonEdgeInsets
        
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
        self.addSubview(infoWhoTurnNowStack)
        self.addSubview(fieldGameView)
        self.addSubview(gameOverButton)
        
        infoWhoTurnNowStack.addArrangedSubview(nameTurnPayerLabel)
        infoWhoTurnNowStack.addArrangedSubview(turnNowTextLabel)
    }
    
    func configureConstraints() {
        infoWhoTurnNowStack.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).inset(Metrics.infoWhoTurnNowStackTopInset)
            make.horizontalEdges.equalToSuperview().inset(Metrics.infoWhoTurnNowStackHorizontalInset)
        }
        
        fieldGameView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(Metrics.fieldGameViewHorizontalInset)
        }
        
        gameOverButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(Metrics.gameOverButtonHorizontalInset)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(Metrics.gameOverButtonBottomInset)
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
