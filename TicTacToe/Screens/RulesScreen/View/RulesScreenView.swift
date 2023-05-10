//
//  RulesScreenView.swift
//  TicTacToe
//
//  Created by Елена on 08.05.2023.
//

import UIKit
import SnapKit

class RulesScreenView: UIView {
    
    // MARK: - Private properties
    
    private enum Metrics {
        static let titleScreenTextSize: CGFloat = 25
        static let titleScreenTopInset: CGFloat = 20
        
        static let rulesStackSpacingElements: CGFloat = 20
        static let rulesStackTopOffset: CGFloat = 35
        static let rulesStackHorizontalInset: CGFloat = 24
        
        static let arrowBackButtontopInset: CGFloat = 10
    }
    
    private var arrowBackButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: ImageTitleConstants.imageArrowBackNavigation), for: .normal)
        
        return view
    }()
    
    private var titleScreen: UILabel = {
        let view = UILabel()
        view.text = StringConstants.titleRulesScreen
        view.textColor = .accentColorApplication
        view.textAlignment = .center
        view.font = UIFont(name: FontTitle.zektonFont, size: Metrics.titleScreenTextSize)
        
        return view
    }()
    
    private var rulesStack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = Metrics.rulesStackSpacingElements
        
        return view
    }()
    
    private var turnInGameInfoBlockView: BlockTitleWithTextView = {
        let view = BlockTitleWithTextView()
        view.setTitle(title: StringConstants.howTurnTitle)
        view.setText(text: StringConstants.howTurnDescription)
        
        return view
    }()
    
    private var gameOverInfoBlockView: BlockTitleWithTextView = {
        let view = BlockTitleWithTextView()
        view.setTitle(title: StringConstants.whenGameOverTitle)
        view.setText(text: StringConstants.whenGameOverDescription)
        
        return view
    }()

    
    // MARK: - Hadnlers
    
    var arrowBackTappedHandler: (() -> Void)?
    
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("error")
    }
}


// MARK: - Private extension

// MARK: - Setup

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
            make.leading.equalToSuperview().inset(Metrics.arrowBackButtontopInset)
            make.centerY.equalTo(titleScreen.snp.centerY)
        }
        
        titleScreen.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).inset(Metrics.titleScreenTopInset)
        }
        
        rulesStack.snp.makeConstraints { make in
            make.top.equalTo(titleScreen.snp.bottom).offset(Metrics.rulesStackTopOffset)
            make.horizontalEdges.equalToSuperview().inset(Metrics.rulesStackHorizontalInset)
        }
    }
    
    func configureActions() {
        arrowBackButton.addTarget(self, action: #selector(arrowBackTapped), for: .touchUpInside)
    }
}

// MARK: - Actions

private extension RulesScreenView {
    
    @objc
    func arrowBackTapped() {
        arrowBackTappedHandler?()
    }
}
