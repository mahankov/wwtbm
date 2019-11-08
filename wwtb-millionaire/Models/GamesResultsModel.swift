//
//  GamesResultsModel.swift
//  wwtb-millionaire
//
//  Created by Anton Makhankov on 08.11.2019.
//  Copyright © 2019 Anton Makhankov. All rights reserved.
//

import Foundation

class GameResultsModel: Codable {
    var win: Bool
    var moneyCollect: Int
    
    init(win: Bool, moneyCollect: Int) {
        self.win = win
        self.moneyCollect = moneyCollect
    }
}
