//
//  AlertPresenterProtocol.swift
//  MovieQuiz
//
//  Created by Аветис Парсаданян on 5/17/24.
//

import Foundation
import UIKit

protocol AlertPresenterProtocol {
    var viewController: UIViewController? { get set }
    func show(alertModel: AlertModel)
}
