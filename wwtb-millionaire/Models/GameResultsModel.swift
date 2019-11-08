//
//  GameResultsModel.swift
//  wwtb-millionaire
//
//  Created by Anton Makhankov on 08.11.2019.
//  Copyright © 2019 Anton Makhankov. All rights reserved.
//

import Foundation

class GameResultsModel: Codable {
    var games: Int
    var questions: Int
    var correctAnswers: Int
    
    init(games: Int, questions: Int, correctAnswers: Int) {
        self.games = games
        self.questions = questions
        self.correctAnswers = correctAnswers
    }
}
