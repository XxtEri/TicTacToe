//
//  MainScreenView.swift
//  TicTacToe
//
//  Created by Елена on 08.05.2023.
//

import UIKit
import SnapKit

class MainScreenView: UIView {
    
    private var rulesTitleLabel: UILabel = {
        let view = UILabel()
        view.text = "Правила игры"
        view.textColor = .rulesTitle
        view.font = UIFont(name: "Zekton", size: 14)
        view.textAlignment = .right
        view.isUserInteractionEnabled = true
        
        return view
    }()
    
    private var welcomeLabel: UILabel = {
        let view = UILabel()
        view.text = "Добро пожаловать!"
        view.textColor = .white
        view.font = UIFont(name: "Zekton", size: 25)
        view.textAlignment = .center
        
        
        return view
    }()
    
    private var infoLabel: UILabel = {
        let view = UILabel()
        view.text = "Перед началом игры  введите имена игроков"
        view.textColor = .white
        view.font = UIFont(name: "Zekton", size: 20)
        view.textAlignment = .center
        view.numberOfLines = .max
        
        return view
    }()
    
    private var inputBlockFirstPlayer: InputBlockView = {
        let view = InputBlockView()
        view.setTitleInputBlock(title: "Первый игрок")
        
        return view
    }()
    
    private var inputBlockSecondPlayer: InputBlockView = {
        let view = InputBlockView()
        view.setTitleInputBlock(title: "Второй игрок")
        
        return view
    }()
    
    private var startPlayButton: UIButton = {
        let view = UIButton()
        view.setTitle("Начать играть", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.font = UIFont(name: "Zekton", size: 18)
        view.layer.cornerRadius = 5
        view.layer.borderColor = UIColor.borderStartGameButton.cgColor
        view.layer.borderWidth = 2
        view.contentEdgeInsets = UIEdgeInsets(top: 13, left: 10, bottom: 13, right: 10)
        view.isEnabled = false
        
        return view
    }()
    
    var startGameButtonTappedHandler: ((Player, Player) -> Void)?
    var rulesLabelTappedHandler: (() -> Void)?
    var editNamesHandler: ((Player, Player) -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("error")
    }
    
    func setEnabledStarGameButton(enabled: Bool) {
        startPlayButton.isEnabled = enabled
    }
    
    func changeLayoutAuthButton(isValidData: Bool) {
        if !isValidData {
            startPlayButton.layer.borderWidth = 2
            startPlayButton.layer.borderColor = UIColor.accentColorApplication.cgColor
            startPlayButton.backgroundColor = .clear
            
        } else {
            startPlayButton.layer.borderWidth = 0
            startPlayButton.layer.borderColor = nil
            startPlayButton.backgroundColor = .accentColorApplication
        }
    }
}

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
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).inset(10)
            make.trailing.equalToSuperview().inset(15)
        }
        
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(rulesTitleLabel.snp.bottom).offset(44)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        inputBlockFirstPlayer.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(24)
            make.top.equalTo(infoLabel.snp.bottom).offset(60)
        }
        
        inputBlockSecondPlayer.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(24)
            make.top.equalTo(inputBlockFirstPlayer.snp.bottom).offset(20)
        }
        
        startPlayButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).inset(15)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
    }
    
    func configureActions() {
        startPlayButton.addTarget(self, action: #selector(startGameButtonTapped), for: .touchUpInside)
        rulesTitleLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(rulesLabelTapped)))
        inputBlockFirstPlayer.inputField.addTarget(self, action: #selector(editNamePlayers), for: .editingChanged)
        inputBlockSecondPlayer.inputField.addTarget(self, action: #selector(editNamePlayers), for: .editingChanged)
    }
    
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
