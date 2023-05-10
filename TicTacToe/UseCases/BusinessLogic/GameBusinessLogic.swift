//
//  GameBusinessLogic.swift
//  TicTacToe
//
//  Created by Елена on 07.05.2023.
//

import Foundation

protocol GameBusinessLogicProtocol {
    var gameOverWinHandler: ((PlayerShapeType) -> Void)? { get set }
    var gameOverDrawHandler: (() -> Void)? { get set }
    
    func saveNewShape(row: Int, column: Int)
    func checkPossibleMoveInGame(row: Int, column: Int) -> Bool
    func changeCurrentPlayer()
    func getCurrentPlayerShape() -> PlayerShapeType
    func checkPresenseWinnerPosition() -> Bool
}

class GameBusinessLogic {
    
    // MARK: - Public porperties
    
    var gameMatrix = [[PlayerShapeType]]()
    var nowTurnPlayerShape: PlayerShapeType
    
    
    // MARK: - Handlers
    
    var gameOverWinHandler: ((PlayerShapeType) -> Void)?
    var gameOverDrawHandler: (() -> Void)?
    
    
    // MARK: - Inits
    
    init() {
        nowTurnPlayerShape = .cross
        
        for _ in 0..<3 {
            var array = [PlayerShapeType]()
            for _ in 0..<3 {
                array.append(PlayerShapeType.non)
            }
            
            gameMatrix.append(array)
        }
    }
    
    // MARK: - Public methods
    
    func checkIfGameOver() -> Bool {
        for row in gameMatrix {
            for cell in row {
                if cell == .non {
                    return false
                }
            }
        }
        
        return true
    }
}


// MARK: - Private extensions

private extension GameBusinessLogic {
    func checkPresenseWinnerPositionOnByRow() -> Bool {
        for i in 0..<gameMatrix.count {
            if gameMatrix[i][0] == .non {
                continue
            }
            
            var isWin = true
            for j in 0..<gameMatrix.count {
                if gameMatrix[i][j] != gameMatrix[i][0] {
                    isWin = false
                    break
                }
            }
            
            if isWin {
                return true
            }
        }
        
        return false
    }
    
    func checkPresenseWinnerPositionOnByColumn() -> Bool {
        for i in 0..<gameMatrix.count {
            if gameMatrix[0][i] == .non {
                continue
            }
            
            var isWin = true
            for j in 0..<gameMatrix.count {
                if gameMatrix[j][i] != gameMatrix[0][i] {
                    isWin = false
                    break
                }
            }
            
            if isWin {
                return true
            }
        }
        
        return false
    }
    
    func checkPresenseWinnerPositionOnFirstDiagonal() -> Bool {
        var isWin = true
        
        if gameMatrix[0][0] == .non {
            return false
        }
        
        for i in 0..<gameMatrix.count {
            if gameMatrix[i][i] != gameMatrix[0][0] {
                isWin = false
                break
            }
        }
        
        if isWin {
            return true
        }
        
        return false
    }
    
    func checkPresenseWinnerPositionOnSecondDiagonal() -> Bool {
        var isWin = true
        
        if gameMatrix[0][gameMatrix.count - 1] == .non {
            return false
        }
        
        for i in 0..<gameMatrix.count {
            if gameMatrix[i][gameMatrix.count - 1 - i] != gameMatrix[0][gameMatrix.count - 1] {
                isWin = false
                break
            }
        }
        
        if isWin {
            return true
        }
        
        return false
    }
    
}


// MARK: - Public extensions

extension GameBusinessLogic: GameBusinessLogicProtocol {
    func saveNewShape(row: Int, column: Int) {
        gameMatrix[row - 1][column - 1] = nowTurnPlayerShape
        
        if checkPresenseWinnerPosition() {
            gameOverWinHandler?(nowTurnPlayerShape)
        }
        
        if checkIfGameOver() {
            gameOverDrawHandler?()
        }
    }
    
    func checkPossibleMoveInGame(row: Int, column: Int) -> Bool {
        gameMatrix[row - 1][column - 1] == .non ? true : false
    }
    
    func checkPresenseWinnerPosition() -> Bool {
        if checkPresenseWinnerPositionOnByRow() ||
            checkPresenseWinnerPositionOnByColumn() ||
            checkPresenseWinnerPositionOnFirstDiagonal() ||
            checkPresenseWinnerPositionOnSecondDiagonal() {
            
            return true
        }
        
        return false
    }
    
    func getCurrentPlayerShape() -> PlayerShapeType {
        nowTurnPlayerShape
    }
    
    func changeCurrentPlayer() {
        nowTurnPlayerShape = nowTurnPlayerShape == .cross ? .circle : .cross
    }
}
