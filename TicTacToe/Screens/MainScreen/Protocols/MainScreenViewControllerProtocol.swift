//
//  MainScreenViewControllerProtocol.swift
//  TicTacToe
//
//  Created by Елена on 08.05.2023.
//

protocol MainScreenViewControllerProtocol: AnyObject {
    var presenter: MainScreenPresenterProtocol { get set }
    
    func showErrorMessages(_ errorMessages: [String])
    func setEnabledButton(enabled: Bool)
    func changeLayoutAuthButton(isValidData: Bool)
}
