//
//  StatisticService.swift
//  MovieQuiz
//
//  Created by Аветис Парсаданян on 5/13/24.
//

import Foundation

protocol StatisticService {
    
    func store(correct count: Int, total amount: Int)
    
    var totalAccuracy: Double { get }
    var gamesCount: Int { get }
    var bestGame: GameRecord { get }
}
