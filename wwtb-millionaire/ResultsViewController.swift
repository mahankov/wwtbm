//
//  ResultsViewController.swift
//  wwtb-millionaire
//
//  Created by Anton Makhankov on 23.10.2019.
//  Copyright © 2019 Anton Makhankov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet var results: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let gameSession = Game.gameSession else { return }
        results.text = "Решено \(gameSession.correctAnswers) из \(gameSession.questionsCount) вопросов"
    }
    
}
