//
//  Game.swift
//  OpenQuizz
//
//  Created by Mallah on 18/10/2019.
//  Copyright © 2019 MallahTaher. All rights reserved.
//

import Foundation

class Game{
    var score = 0
    
    private var questions = [Question]()
    
    enum State{
        case ongoing, over
    }
    
    var state : State = .ongoing
    
    private var currentIndex = 0
    
    var currentQuestion : Question{
            return questions[currentIndex]
    }
    
    func refresh() {
        score = 0
        currentIndex = 0
        state = .over
        
        QuestionManager.shared.get { (questions) in  // on a transféré ici la fonction receiveQuestions
            self.questions = questions             // sous forme de closure
            self.state = .ongoing       // perte de contexte donc ajout du mot self devant questions
            
            let name = Notification.Name(rawValue: "QuestionsLoaded") //  first on crée un nom de notif
            let notification = Notification(name: name) // création de la notif ac en param le nom crée
            NotificationCenter.default.post(notification)   // envoi de la notif
        }
    }
    
//    private func receiveQuestions(_ questions:[Question]){
//
//    }
    
    func answerCurrentQuestion(with answer:Bool){
        if  (currentQuestion.isCorrect && answer) || (!currentQuestion.isCorrect && !answer) {  // currentQuestion.isCorrect == answer <- valide ??
            score += 1
        }
        goToNextQuestion()
    }
    
    private func goToNextQuestion(){ // on met en private car func interne a la classe
        if currentIndex < questions.count - 1{  // pk moins 1 : Pcq currentIndex va de 0 à 9 (et question.count = 10)
            currentIndex += 1
        }else{
            finishGame()
        }
    }
    
    private func finishGame(){ // on met en private car func interne a la classe
        state = .over
    }
}
