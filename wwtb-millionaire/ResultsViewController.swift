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
        if Game.shared.questions > 0 {
            results.text = "Из \(Game.shared.questions) вопросов, верно отвечено на \(Game.shared.answers)"
        } else {
            results.text = "Вы еще ни разу не сыграли!"
        }
    }

}
