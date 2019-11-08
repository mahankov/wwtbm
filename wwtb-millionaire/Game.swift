//
//  Game.swift
//  wwtb-millionaire
//
//  Created by Anton Makhankov on 24.10.2019.
//  Copyright © 2019 Anton Makhankov. All rights reserved.
//

import Foundation

class Game: Codable {
    private let gameCaretaker = GameCaretaker()
    static let shared = Game()
    var gameResults: [GameResultsModel] = []
    var gameSession: GameSession? {
        didSet {
            do {
                try gameCaretaker.saveGame(self.gameResults)
            }
            catch {
                print("Can't save the game")
            }
        }
    }
    
    private init() {
        do {
            try self.gameResults = gameCaretaker.loadGame()
        }
        catch {
            print("Can't load the game")
        }
    }
    
    func newSession(session: GameSession) {
        gameSession = session
        if session.questionsCount == session.correctAnswers {
            gameResults.append(GameResultsModel(win: true, moneyCollect: session.winAmount))
        } else {
            gameResults.append(GameResultsModel(win: false, moneyCollect: session.winAmount))
        }
    }
}

typealias Memento = Data

class GameCaretaker: Codable {
    private let key = "game"
    
    func saveGame(_ gameResultsModel: [GameResultsModel]) throws {
        let data: Memento = try JSONEncoder().encode(gameResultsModel)
        UserDefaults.standard.set(data, forKey: key)
    }
    
    func loadGame() throws -> [GameResultsModel] {
        guard let data = UserDefaults.standard.value(forKey: key) as? Memento
            , let gameResults = try? JSONDecoder().decode([GameResultsModel].self, from: data) else {
                throw Error.gameNotFound
        }
        return gameResults
    }
    
    public enum Error: Swift.Error {
        case gameNotFound
    }
}
