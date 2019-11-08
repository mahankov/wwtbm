//
//  QuestionsModel.swift
//  wwtb-millionaire
//
//  Created by Anton Makhankov on 23.10.2019.
//  Copyright © 2019 Anton Makhankov. All rights reserved.
//

import Foundation

class QuestionsArray {
    var question:String
    var correct:Int
    var answers:Array<String>
    
    init(question:String, correct:Int, answers:Array<String>) {
        self.question = question
        self.correct = correct
        self.answers = answers
    }
}
