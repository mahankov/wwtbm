//
//  Game.swift
//  wwtb-millionaire
//
//  Created by Anton Makhankov on 24.10.2019.
//  Copyright © 2019 Anton Makhankov. All rights reserved.
//

import Foundation


class Game {
    static let shared = Game()
    var questions = 0
    var answers = 0
    var gameSession: [GameSession] = []
    
    private init() {}
    
    func newSession(session: GameSession) {
        gameSession.append(session)
        questions += session.questionsCount
        answers += session.correctAnswers
    }
}
