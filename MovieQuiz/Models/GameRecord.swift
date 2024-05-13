//
//  GameRecord.swift
//  MovieQuiz
//
//  Created by Аветис Парсаданян on 5/13/24.
//

import Foundation

struct GameRecord: Codable {
    let correct: Int
    let total: Int
    let date: Date
    
    func isBetterThan(_ another: GameRecord) -> Bool {
            correct > another.correct
        }
    
}
