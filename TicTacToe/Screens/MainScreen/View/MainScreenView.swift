//
//  MainScreenView.swift
//  TicTacToe
//
//  Created by Елена on 08.05.2023.
//

import UIKit
import SnapKit

class MainScreenView: UIView {
    
    // MARK: - Private properties
    
    private enum Metrics {
        static let titleButtonRulesTextSize: CGFloat = 14
        static let rulesTitleLabelTopInset: CGFloat = 10
        static let rulesTitleLabelTrailingInset: CGFloat = 15
        
        static let titleWelcomeTextSize: CGFloat = 25
        static let welcomeLabelTopOffset: CGFloat = 44
        static let welcomeLabelHorizontalInset: CGFloat = 24
        
        static let titleInfoTextSize: CGFloat = 20
        static let infoLabelTopOffset: CGFloat = 10
        static let infoLabelHorizontalInset: CGFloat = 24
        
        static let inputBlockFirstPlayerHorizontalInset: CGFloat = 24
        static let inputBlockFirstPlayerTopOffset: CGFloat = 60
        
        static let inputBlockSecondPlayerHorizontalInset: CGFloat = 24
        static let inputBlockSecondPlayerTopOffset: CGFloat = 20
        
        static let titleStartGameButtonTextSize: CGFloat = 18
        static let startGameButtonBorderWidthWhenInvalidData: CGFloat = 2
        static let startGameButtonBorderWidthWhenValidData: CGFloat = 0
        static let startGameButtonCornerRadius: CGFloat = 5
        static let startGameButtonEdgeInsets = UIEdgeInsets(top: 13, left: 10, bottom: 13, right: 10)
        static let startPlayButtonBottomInset: CGFloat = 15
        static let startPlayButtonHorizontalInset: CGFloat = 16
    }
    
    private var rulesTitleLabel: UILabel = {
        let view = UILabel()
        view.text = StringConstants.titleButtonRules
        view.textColor = .rulesTitle
        view.font = UIFont(name: FontTitle.zektonFont, size: Metrics.titleButtonRulesTextSize)
        view.textAlignment = .right
        view.isUserInteractionEnabled = true
        
        return view
    }()
    
    private var welcomeLabel: UILabel = {
        let view = UILabel()
        view.text = StringConstants.welcome
        view.textColor = .white
        view.font = UIFont(name: FontTitle.zektonFont, size: Metrics.titleWelcomeTextSize)
        view.textAlignment = .center
        
        
        return view
    }()
    
    private var infoLabel: UILabel = {
        let view = UILabel()
        view.text = StringConstants.infoGame
        view.textColor = .white
        view.font = UIFont(name: FontTitle.zektonFont, size: Metrics.titleInfoTextSize)
        view.textAlignment = .center
        view.numberOfLines = .max
        
        return view
    }()
    
    private var inputBlockFirstPlayer: InputBlockView = {
        let view = InputBlockView()
        view.setTitleInputBlock(title: StringConstants.titleFirstInputBlock)
        
        return view
    }()
    
    private var inputBlockSecondPlayer: InputBlockView = {
        let view = InputBlockView()
        view.setTitleInputBlock(title: StringConstants.titleSecondInputBlock)
        
        return view
    }()
    
    private var startPlayButton: UIButton = {
        let view = UIButton()
        view.setTitle(StringConstants.titleStartGameButton, for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.font = UIFont(name: FontTitle.zektonFont, size: Metrics.titleStartGameButtonTextSize)
        view.layer.cornerRadius = Metrics.startGameButtonCornerRadius
        view.contentEdgeInsets = Metrics.startGameButtonEdgeInsets
        
        return view
    }()
    
    
    // MARK: - Handlers
    
    var startGameButtonTappedHandler: ((Player, Player) -> Void)?
    var rulesLabelTappedHandler: (() -> Void)?
    var editNamesHandler: ((Player, Player) -> Void)?

    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("error")
    }
    
    
    // MARK: - Public methods
    
    func setEnabledStarGameButton(enabled: Bool) {
        startPlayButton.isEnabled = enabled
    }
    
    func changeLayoutAuthButton(isValidData: Bool) {
        if !isValidData {
            startPlayButton.layer.borderWidth = Metrics.startGameButtonBorderWidthWhenInvalidData
            startPlayButton.layer.borderColor = UIColor.accentColorApplication.cgColor
            startPlayButton.backgroundColor = .clear
            
        } else {
            startPlayButton.layer.borderWidth = Metrics.startGameButtonBorderWidthWhenValidData
            startPlayButton.layer.borderColor = nil
            startPlayButton.backgroundColor = .accentColorApplication
        }
    }
    
    func getNameFirstPlayer() -> String {
        inputBlockFirstPlayer.getNamePlayer()
    }
    
    func getNameSecondPlayer() -> String {
        inputBlockSecondPlayer.getNamePlayer()
    }
}


// MARK: - Public extension

// MARK: - Setup

extension MainScreenView {

    func setup() {
        addViews()
        configureUI()
        configureConstraints()
        configureActions()
    }
    
    func addViews() {
        self.addSubview(rulesTitleLabel)
        self.addSubview(welcomeLabel)
        self.addSubview(infoLabel)
        self.addSubview(startPlayButton)
        
        self.addSubview(inputBlockFirstPlayer)
        self.addSubview(inputBlockSecondPlayer)
    }
    
    func configureUI() {
        self.backgroundColor = .black
    }
    
    func configureConstraints() {
        rulesTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).inset(Metrics.rulesTitleLabelTopInset)
            make.trailing.equalToSuperview().inset(Metrics.rulesTitleLabelTrailingInset)
        }
        
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(rulesTitleLabel.snp.bottom).offset(Metrics.welcomeLabelTopOffset)
            make.horizontalEdges.equalToSuperview().inset(Metrics.welcomeLabelHorizontalInset)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(Metrics.infoLabelTopOffset)
            make.horizontalEdges.equalToSuperview().inset(Metrics.infoLabelHorizontalInset)
        }
        
        inputBlockFirstPlayer.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(Metrics.inputBlockFirstPlayerHorizontalInset)
            make.top.equalTo(infoLabel.snp.bottom).offset(Metrics.inputBlockFirstPlayerTopOffset)
        }
        
        inputBlockSecondPlayer.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(Metrics.inputBlockSecondPlayerHorizontalInset)
            make.top.equalTo(inputBlockFirstPlayer.snp.bottom).offset(Metrics.inputBlockSecondPlayerTopOffset)
        }
        
        startPlayButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).inset(Metrics.startPlayButtonBottomInset)
            make.horizontalEdges.equalToSuperview().inset(Metrics.startPlayButtonHorizontalInset)
        }
    }
    
    func configureActions() {
        startPlayButton.addTarget(self, action: #selector(startGameButtonTapped), for: .touchUpInside)
        rulesTitleLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(rulesLabelTapped)))
        inputBlockFirstPlayer.inputField.addTarget(self, action: #selector(editNamePlayers), for: .editingChanged)
        inputBlockSecondPlayer.inputField.addTarget(self, action: #selector(editNamePlayers), for: .editingChanged)
    }
}

// MARK: - Actions

private extension MainScreenView {
    @objc
    func startGameButtonTapped() {
        let firstPlayer = Player(name: inputBlockFirstPlayer.getNamePlayer())
        let secondPlayer = Player(name: inputBlockSecondPlayer.getNamePlayer())
        
        startGameButtonTappedHandler?(firstPlayer, secondPlayer)
    }
    
    @objc
    func rulesLabelTapped() {
        rulesLabelTappedHandler?()
    }
    
    @objc
    func editNamePlayers() {
        let firstPlayer = Player(name: inputBlockFirstPlayer.getNamePlayer())
        let secondPlayer = Player(name: inputBlockSecondPlayer.getNamePlayer())
        editNamesHandler?(firstPlayer, secondPlayer)
    }
}
