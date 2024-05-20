//
//  MovieQuizViewControllerProtocol.swift
//  MovieQuiz
//
//  Created by Аветис Парсаданян on 5/20/24.
//

import Foundation
import UIKit

protocol MovieQuizViewControllerProtocol: AnyObject {
    func show(quiz step: QuizStepViewModel)
    func show(quiz result: QuizResultsViewModel)
        
    func highlightImageBorder(isCorrectAnswer: Bool)
    
    func blockButtons()
    func unblockButtons()
        
    func showLoadingIndicator()
    func hideLoadingIndicator()
        
    func showNetworkError(message: String)
}
