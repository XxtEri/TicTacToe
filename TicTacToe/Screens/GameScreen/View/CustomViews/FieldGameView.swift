//
//  FieldGameView.swift
//  TicTacToe
//
//  Created by Елена on 07.05.2023.
//

import UIKit
import SnapKit

class FieldGameView: UIView {
    
    // MARK: - Private properties
    
    private enum Metrics {
        static let sizeLine: CGFloat = 4
        static let lineVerticalInset: CGFloat = 13
        static let lineHorizontalInset: CGFloat = 13
        static let imageVerticalInset: CGFloat = 20
        static let imageHorizontalInset: CGFloat = 20
        
        static let sizeFieldGame: CGFloat = UIScreen.main.bounds.width - 24 * 2
        static let widthCell: CGFloat = (sizeFieldGame - sizeLine * 2) / 3
        static let heightCell: CGFloat = (sizeFieldGame - sizeLine * 2) / 3
    }
    
    private var verticalLineFirstView = LineInFieldGame()
    
    private var verticalLineSecondView = LineInFieldGame()
    
    private var horizontalLineFirstView = LineInFieldGame()
    
    private var horizontalLineSecondView = LineInFieldGame()
    
    
    // MARK: - Handlers
    
    var fieldGameTappedHandler: ((CGFloat, CGFloat, CGFloat) -> Void)?
    
    
    // MARK: - Inits

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Private methods
    
    private func setupImageConstraints(image: UIImageView, positionX: CGFloat, positionY: CGFloat) {
        image.snp.makeConstraints { make in
            make.size.equalTo(Metrics.widthCell - 15 * 4)
            make.centerX.equalTo(positionX)
            make.centerY.equalTo(positionY)
        }
    }
    
    
    // MARK: - Public methods
    
    func addCrossImage(positionX: CGFloat, positionY: CGFloat) {
        let image = UIImageView(image: UIImage(named: "Cross"))
        image.contentMode = .scaleAspectFit
        
        self.addSubview(image)
        
        setupImageConstraints(image: image, positionX: positionX, positionY: positionY)
    }
    
    func addCircleImage(positionX: CGFloat, positionY: CGFloat) {
        let image = UIImageView(image: UIImage(named: "Circle"))
        image.contentMode = .scaleAspectFit
        
        self.addSubview(image)
        
        setupImageConstraints(image: image, positionX: positionX, positionY: positionY)
    }
}


// MARK: - Private methods

// MARK: - Setup

private extension FieldGameView {
    func setup() {
        addViews()
        configureUI()
        configureConstraints()
        configureAction()
    }
    
    func addViews() {
        self.addSubview(verticalLineFirstView)
        self.addSubview(verticalLineSecondView)
        self.addSubview(horizontalLineFirstView)
        self.addSubview(horizontalLineSecondView)
    }
    
    func configureUI() {
        self.backgroundColor = .backgroundFieldGame
        self.layer.cornerRadius = 8
        self.bounds.size = CGSize(width: Metrics.sizeFieldGame, height: Metrics.sizeFieldGame)
    }
    
    func configureConstraints() {
        verticalLineFirstView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(Metrics.lineVerticalInset)
            make.leading.equalToSuperview().inset(Metrics.widthCell)
            make.width.equalTo(Metrics.sizeLine)
        }
        
        verticalLineSecondView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(Metrics.lineVerticalInset)
            make.leading.equalTo(verticalLineFirstView.snp.trailing).inset(-Metrics.widthCell)
            make.trailing.equalToSuperview().inset(Metrics.widthCell)
            make.width.equalTo(Metrics.sizeLine)
        }
        
        horizontalLineFirstView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(Metrics.lineHorizontalInset)
            make.top.equalToSuperview().inset(Metrics.heightCell)
            make.height.equalTo(Metrics.sizeLine)
        }
        
        horizontalLineSecondView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(Metrics.lineHorizontalInset)
            make.top.equalTo(horizontalLineFirstView.snp.bottom).inset(-Metrics.heightCell)
            make.bottom.equalToSuperview().inset(Metrics.heightCell)
            make.height.equalTo(Metrics.sizeLine)
        }
    }
    
    func configureAction() {
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(fieldGameTapped(selector:))))
    }
}

// MARK: - Actions

private extension FieldGameView {
    
    @objc
    func fieldGameTapped(selector: UITapGestureRecognizer) {
        let touchPoint = selector.location(in: self)
        
        fieldGameTappedHandler?(touchPoint.x, touchPoint.y, Metrics.sizeFieldGame)
    }
}
