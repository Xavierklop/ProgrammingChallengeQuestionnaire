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
        case .question1: return "Do you enjoy working in a team?"
        case .question2: return "How long have you been working with Swift?"
        case .question3: return "How do you feel about automated tests?"
        case .evaluation: return "Points evaluation:"
        }
    }
}














