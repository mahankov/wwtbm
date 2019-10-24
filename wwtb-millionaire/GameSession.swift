//
//  GameSession.swift
//  wwtb-millionaire
//
//  Created by Anton Makhankov on 24.10.2019.
//  Copyright © 2019 Anton Makhankov. All rights reserved.
//

import Foundation

class GameSession {
    var questionsCount: Int = 0
    var correctAnswers: Int = 0
    
    func loadQuestionsCount(count: Int) {
        self.questionsCount = count
    }
    func incCorrectAnswers() {
        self.correctAnswers += 1
    }
}
