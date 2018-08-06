//
//  QuestionnaireChapter.swift
//  ProgrammingChallengeQuestionnaire
//
//  Created by Hao Wu on 2018/8/5.
//  Copyright © 2018年 Hao Wu. All rights reserved.
//

import Foundation

enum QuestionnaireChapter {
    case question1
    case question2
    case question3
    case evaluation
}

extension QuestionnaireChapter {
    var text: String {
        switch self {
        case .question1: return """
            Question 1
            Do you enjoy working in a team?
            """
        case .question2: return """
            Question 2
            How long have you been working with Swift?
            """
        case .question3: return """
            Question 3
            How do you feel about automated tests?
            """
        case .evaluation:
            let points = QuestionnairePoints.points
            var result = ""
            if points < 7 {
                result = "0-6 points: Unfortunately, we don’t match!"
            } else if points < 10 {
                result = "7-9 points: That looks good!"
            } else {
                result = "10 points or more: Excellent!"
            }
            
            return """
            Points evaluation:
            \(points) points
            \(result)
            """
        }
    }
}














