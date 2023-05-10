//
//  StringConstants.swift
//  TicTacToe
//
//  Created by Елена on 10.05.2023.
//

import Foundation

// MARK: - String constants on the screens application

struct StringConstants {
    
    // MARK: - Title in alert
    
    static let titleAlertWithErrorMessage = "Внимание!"
    static let titleButtonCancelOfAlert = "Закрыть"
    static let buttonGoMainScreen = "Вернуться на главную"
    static let titleAlertGameOver = "Игра окончена"
    static let messageGameOverWithWinner = "Победитель"
    static let messageGameOverWithoutWinner = "Объявлена ничья"
    
    
    //MARK: - Main screen
    
    static let titleButtonRules = "Правила игры"
    static let welcome = "Добро пожаловать!"
    static let infoGame = "Перед началом игры  введите имена игроков"
    static let titleFirstInputBlock = "Первый игрок"
    static let titleSecondInputBlock = "Второй игрок"
    static let titleStartGameButton = "Начать играть"
    static let inputFieldPlaceholderText = "Введите имя"
    
    
    //MARK: - Rules screen
    
    static let titleRulesScreen = "Правила игры"
    static let howTurnTitle = "Как ходить в игре?"
    static let howTurnDescription = "Игроки по очереди ставят на свободные клетки поля 3×3 знаки (один всегда крестики, другой всегда нолики).\nПервый ход делает игрок, ставящий крестики."
    static let whenGameOverTitle = "Когда игра завершается?"
    static let whenGameOverDescription = "Первый, выстроивший в ряд 3 своих фигуры по вертикали, горизонтали или большой диагонали, выигрывает. Если игроки заполнили все 9 ячеек и оказалось, что ни в одной вертикали, горизонтали или большой диагонали нет трёх одинаковых знаков, партия считается закончившейся в ничью."
    
    
    //MARK: - Game screen
    
    static let turnNowText = "ходит сейчас"
    static let titleStopGameButton = "Закончить игру"
}
