//
//  MainScreenViewControllerProtocol.swift
//  TicTacToe
//
//  Created by Елена on 08.05.2023.
//

protocol MainScreenViewControllerProtocol: AnyObject {
    var presenter: MainScreenPresenterProtocol { get set }
}
