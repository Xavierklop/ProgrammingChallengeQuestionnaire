//
//  Page.swift
//  ProgrammingChallengeQuestionnaire
//
//  Created by Hao Wu on 2018/8/5.
//  Copyright © 2018年 Hao Wu. All rights reserved.
//

import Foundation

class Page {
    let questionnaireChapter: QuestionnaireChapter
    
    typealias Choice = (title: String, page: Page, points: Int)
    
    var firstChoice: Choice?
    var secondChoice: Choice?
    var thirdChoice: Choice?
    var fourthChoice: Choice?
    
    init(questionnaireChapter: QuestionnaireChapter) {
        self.questionnaireChapter = questionnaireChapter
    }
}

extension Page {
    
    func addChoiceWith(title: String, questionnaireChapter: QuestionnaireChapter, points: Int) -> Page {
        let page = Page(questionnaireChapter: questionnaireChapter)
        return addChoiceWith(title: title, page: page, points: points)
    }
    
    func addChoiceWith(title: String, page: Page, points: Int) -> Page {
        
        switch (firstChoice, secondChoice, thirdChoice, fourthChoice) {
        // don't need add choice
        case (.some, .some, .some, .some): return self
        // add first choice
        case (.none, .none, .none, .none), (.none, .none, .none, .some), (.none, .none, .some, .none), (.none, .some, .none, .none), (.none, .some, .none, .some), (.none, .some, .some, .none), (.none, .none, .some, .some), (.none, .some, .some, .some): firstChoice = (title, page, points)
        // add second choice
        case (.some, .none, .none, .none), (.some, .none, .none, .some), (.some, .none, .some, .none), (.some, .none, .some, .some): secondChoice = (title, page, points)
        // add third choice
        case (.some, .some, .none, .some), (.some, .some, .none, .none): thirdChoice = (title, page, points)
        // add fourth choice
        case (.some, .some, .some, .none): fourthChoice = (title, page, points)
        }
        
        return page
    }
}

struct Questionnaire {
    static var questionnaireLinedLists: Page {
        let question1Page = Page(questionnaireChapter: .question1)
        
        // page add choices here!
        // 1, Add 3 choices to question1Page and creat question2Page.
        let question2Page = question1Page.addChoiceWith(title: "Teamwork is in my blood", questionnaireChapter: .question2, points: 5)
        // Note: if the page is already exist, use addChoiceWith(title:, page:, points:)
        question1Page.addChoiceWith(title: "Yes, I do", page: question2Page, points: 3)
        question1Page.addChoiceWith(title: "I prefer to work alone", page: question2Page, points: 0)
        
        
        // 2, Add 4 choices to question2Page and creat question3Page.
        let question3Page = question2Page.addChoiceWith(title: "Never", questionnaireChapter: .question3, points: 0)
        question2Page.addChoiceWith(title: "Less than 1 year", page: question3Page, points: 1)
        question2Page.addChoiceWith(title: "Less than 2 years", page: question3Page, points: 3)
        question2Page.addChoiceWith(title: "More than 3 years", page: question3Page, points: 5)
        
        
        // 3, Add 2 choices to question3Page and creat evaluationPage.
        let evaluationPage = question3Page.addChoiceWith(title: "Mandatory", questionnaireChapter: .evaluation, points: 3)
        question3Page.addChoiceWith(title: "Waste of time", page: evaluationPage, points: 0)
        
        
        return question1Page
    }
    
}

























