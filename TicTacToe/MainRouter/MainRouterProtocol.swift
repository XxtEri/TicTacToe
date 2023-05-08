//
//  MainRouterProtocol.swift
//  TicTacToe
//
//  Created by Елена on 07.05.2023.
//

import UIKit

protocol MainRouterProtocol {
    var navigationController: UINavigationController? { get set }
    
    func start() -> UINavigationController
}
