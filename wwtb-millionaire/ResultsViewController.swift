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
    
    func wordForm(number: Int) -> String {
        let lastDigit = String(number).last
        switch lastDigit {
        case "1":
            return "игру"
        case "2":
            return "игры"
        case "3":
            return "игры"
        case "4":
            return "игры"
        default:
            return "игр"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if Game.shared.gameResults.count > 0 {
            var moneyAmount = 0
            for money in Game.shared.gameResults {
                moneyAmount += money.moneyCollect
            }
            results.text = "Вы сыграли \(Game.shared.gameResults.count) \(wordForm(number: Game.shared.gameResults.count)) и заработали \(moneyAmount) руб"
        } else {
            results.text = "Вы еще ни разу не сыграли!"
        }
    }

}
