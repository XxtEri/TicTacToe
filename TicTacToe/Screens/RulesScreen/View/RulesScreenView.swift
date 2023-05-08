//
//  RulesScreenView.swift
//  TicTacToe
//
//  Created by Елена on 08.05.2023.
//

import UIKit
import SnapKit

class RulesScreenView: UIView {
    
    private var arrowBackButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "ArrowBackNavigation"), for: .normal)
        
        return view
    }()
    
    private var titleScreen: UILabel = {
        let view = UILabel()
        view.text = "Правила игры"
        view.textColor = .accentColorApplication
        view.textAlignment = .center
        view.font = UIFont(name: "Zekton", size: 25)
        
        return view
    }()
    
    private var rulesStack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 20
        
        return view
    }()
    
    private var turnInGameInfoBlockView: BlockTitleWithTextView = {
        let view = BlockTitleWithTextView()
        view.setTitle(title: "Как ходить в игре?")
        view.setText(text: "Игроки по очереди ставят на свободные клетки поля 3×3 знаки (один всегда крестики, другой всегда нолики).\nПервый ход делает игрок, ставящий крестики.")
        
        return view
    }()
    
    private var gameOverInfoBlockView: BlockTitleWithTextView = {
        let view = BlockTitleWithTextView()
        view.setTitle(title: "Когда игра завершается?")
        view.setText(text: "Первый, выстроивший в ряд 3 своих фигуры по вертикали, горизонтали или большой диагонали, выигрывает. Если игроки заполнили все 9 ячеек и оказалось, что ни в одной вертикали, горизонтали или большой диагонали нет трёх одинаковых знаков, партия считается закончившейся в ничью.")
        
        return view
    }()

    var arrowBackTappedHandler: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("error")
    }
}

private extension RulesScreenView {
    func setup() {
        addViews()
        configureUI()
        configureConstraints()
        configureActions()
    }
    
    func addViews() {
        self.addSubview(arrowBackButton)
        self.addSubview(titleScreen)
        self.addSubview(rulesStack)
        
        rulesStack.addArrangedSubview(turnInGameInfoBlockView)
        rulesStack.addArrangedSubview(gameOverInfoBlockView)
    }
    
    func configureUI() {
        self.backgroundColor = .black
    }
    
    func configureConstraints() {
        arrowBackButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.centerY.equalTo(titleScreen.snp.centerY)
        }
        
        titleScreen.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).inset(20)
        }
        
        rulesStack.snp.makeConstraints { make in
            make.top.equalTo(titleScreen.snp.bottom).offset(35)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
    }
    
    func configureActions() {
        arrowBackButton.addTarget(self, action: #selector(arrowBackTapped), for: .touchUpInside)
    }
    
    @objc
    func arrowBackTapped() {
        arrowBackTappedHandler?()
    }
}
