//
//  GameViewController.swift
//  wwtb-millionaire
//
//  Created by Anton Makhankov on 23.10.2019.
//  Copyright © 2019 Anton Makhankov. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    @IBOutlet weak var newGame: UIButton!
    
    var game = Game.self
    
    var questionsArray = [
        QuestionsArray(question: "Как правильно продолжить припев детской песни: Тили-тили...?", correct: 2, answers: ["хали-гали","трали-вали","жили-были","ели-пили"], level: 1),
        QuestionsArray(question: "Что понадобится, чтобы взрыхлить землю на грядке?", correct: 1, answers: ["тяпка","бабка","скобка","тряпка"], level: 1),
        QuestionsArray(question: "Как называется экзотическое животное из Южной Америки?", correct: 3, answers: ["пчеложор","термитоглот","муравьед","комаролов"], level: 1),
        QuestionsArray(question: "Во что превращается гусеница?", correct: 4, answers: ["в мячик","в пирамидку","в машинку","в куколку"], level: 2),
        QuestionsArray(question: "К какой группе музыкальных инструментов относится валторна?", correct: 4, answers: ["струнные","клавишные","ударные","духовые"], level: 2)
    ]
    
    var currentQuestion: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
    }
    
    func showQuestion() {
        if questionsArray.count > currentQuestion + 1 {
            question.text = questionsArray[currentQuestion].question
            answer1.setTitle(questionsArray[currentQuestion].answers[0], for: .normal)
            answer2.setTitle(questionsArray[currentQuestion].answers[1], for: .normal)
            answer3.setTitle(questionsArray[currentQuestion].answers[2], for: .normal)
            answer4.setTitle(questionsArray[currentQuestion].answers[3], for: .normal)
        } else {
            question.text = "Поздравляем, вы выиграли!"
            answer1.isHidden = true
            answer2.isHidden = true
            answer3.isHidden = true
            answer4.isHidden = true
            newGame.isHidden = false
        }
    }
    
    func startNewGame() {
        currentQuestion = 0
        game.gameSession?.questionsCount = questionsArray.count
        newGame.isHidden = true
        answer1.isHidden = false
        answer2.isHidden = false
        answer3.isHidden = false
        answer4.isHidden = false
        showQuestion()
    }
    
    func gameOver() {
        game.gameSession?.correctAnswers = currentQuestion
        answer1.isHidden = true
        answer2.isHidden = true
        answer3.isHidden = true
        answer4.isHidden = true
        newGame.isHidden = false
        question.text = "Неверный ответ! Вы проиграли!"
    }
    
    func checkAnswer(number: Int) {
        if number == questionsArray[currentQuestion].correct {
            currentQuestion += 1
            showQuestion()
        } else {
            gameOver()
        }
    }
    
    @IBAction func answerButton1() {
        checkAnswer(number: 1)
    }
    
    @IBAction func answerButton2() {
        checkAnswer(number: 2)
    }
    
    @IBAction func answerButton3() {
        checkAnswer(number: 3)
    }
    
    @IBAction func answerButton4() {
        checkAnswer(number: 4)
    }
    
    @IBAction func newGameButton() {
        startNewGame()
    }
}