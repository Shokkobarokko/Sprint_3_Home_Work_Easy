//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by Аветис Парсаданян on 5/12/24.
//

import Foundation


struct AlertModel{
    let title: String
    let message: String
    let buttonText: String
    let completion: () -> ();
}
