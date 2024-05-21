//
//  AlertPresenter.swift
//  MovieQuiz
//
//  Created by Аветис Парсаданян on 5/12/24.
//

import Foundation
import UIKit

//final class AlertPresenter{
//    func showAlert(viewController: UIViewController, model: AlertModel){
//        let alert = UIAlertController(
//            title: model.title,
//            message: model.message,
//            preferredStyle: .alert)
//        
//        let action = UIAlertAction(title: model.buttonText, style: .default)  {
//            _ in model.completion()
////            self.currentQuestionIndex = 0
////            self.correctAnswers = 0
////            
////            questionFactory.requestNextQuestion()
//        }
//        
//        alert.addAction(action)
//        
//        viewController.present(alert, animated: true, completion: nil)
//    }
//}

final class AlertPresenter {
    weak var viewController: UIViewController?
    
    func show(alertModel: AlertModel) {
        let alert = UIAlertController(title: alertModel.title, message: alertModel.message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: alertModel.buttonText, style: .default) { _ in
            alertModel.completion()
        }
        
        alert.addAction(action)
        
        viewController?.present(alert, animated: true)
    }
    
}

