//
//  PageController.swift
//  ProgrammingChallengeQuestionnaire
//
//  Created by Hao Wu on 2018/8/5.
//  Copyright © 2018年 Hao Wu. All rights reserved.
//

import UIKit

extension NSAttributedString {
    var stringRange: NSRange {
        return NSMakeRange(0, self.length)
    }
}

extension QuestionnaireChapter {
    // here, you inside of QuestionnaireChapter!
    var attributedText: NSAttributedString {
        let attributdString = NSMutableAttributedString(string: text)
        
        let pargraphStyle = NSMutableParagraphStyle()
        pargraphStyle.lineSpacing = 10
        
        attributdString.addAttribute(NSAttributedStringKey.paragraphStyle, value: pargraphStyle, range: attributdString.stringRange)
        
        return attributdString
    }
}

extension Page {
    func questionnaireChapter(attributed: Bool) -> NSAttributedString {
        if attributed {
            return questionnaireChapter.attributedText
        } else {
            return NSAttributedString(string: questionnaireChapter.text)
        }
    }
}

class PageController: UIViewController {
    
    var page: Page?
    
    // MARK: - User Interface Properties
    
    // stored properties(here like questionLabel...) is assigned initial values prior to(before ) the objects initialization!!!! But use lazy var it can defer the initialization of property.
    // That is to say, because lazy loaded properties are created after object initialzation meaning "self" key word is available to access. So we can access self inside a closure when mark the property as lazily loaded!!!!!
    lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.attributedText = self.page?.questionnaireChapter(attributed: true)
        
        return label
    }()
    
    lazy var firstChoiceButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let title = self.page?.firstChoice?.title ?? "Start Again"
        // Selector(a pointer) is a link to the method name that we want to call or a name used to select a method to execute for an object.
        let selector = self.page?.firstChoice != nil ? #selector(PageController.loadFirstChoice) : #selector(PageController.startAgain)
        
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: selector, for: .touchUpInside)
        
        return button
    }()
    
    lazy var secondChoiceButton : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle(self.page?.secondChoice?.title, for: .normal)
        button.addTarget(self, action: #selector(PageController.loadSecondChoice), for: .touchUpInside)
        
        return button
    }()
    
    lazy var thirdChoiceButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle(self.page?.thirdChoice?.title, for: .normal)
        button.addTarget(self, action: #selector(PageController.loadThirdChoice), for: .touchUpInside)
        
        return button
    }()
    
    lazy var fourthChoiceButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle(self.page?.fourthChoice?.title, for: .normal)
        button.addTarget(self, action: #selector(PageController.loadFourthChoice), for: .touchUpInside)
        
        return button
    }()
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(page: Page) {
        self.page = page
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        view.addSubview(questionLabel)
        
        NSLayoutConstraint.activate([
            questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
            questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0),
            questionLabel.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -48.0)
            ])
        
        view.addSubview(firstChoiceButton)
        
        NSLayoutConstraint.activate([
            firstChoiceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstChoiceButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -176)
            ])
        
        view.addSubview(secondChoiceButton)
        
        NSLayoutConstraint.activate([
            secondChoiceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondChoiceButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -128)
            ])
        
        view.addSubview(thirdChoiceButton)
        
        NSLayoutConstraint.activate([
            thirdChoiceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            thirdChoiceButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80.0)
            ])
        
        view.addSubview(fourthChoiceButton)
        
        NSLayoutConstraint.activate([
            fourthChoiceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fourthChoiceButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32)
            ])
        
        
    }
    
    @objc func loadFirstChoice() {
        if let page = page, let firstChoice = page.firstChoice {
            let nextPage = firstChoice.page
            // Remember use view controller manage view.
            let pageController = PageController(page: nextPage)
            
            if let statusNumber = navigationController?.viewControllers.count {
                if statusNumber == 2 {
                    QuestionnairePoints.answerPoints.removeAll()
                    QuestionnairePoints.answerPoints.append(firstChoice.points)
                    QuestionnairePoints.points = firstChoice.points
                    
                } else if statusNumber == 3 {
                    QuestionnairePoints.answerPoints.append(firstChoice.points)
                    let range = QuestionnairePoints.answerPoints.count - 1
                    QuestionnairePoints.answerPoints.removeSubrange(1..<range)
                    QuestionnairePoints.points = QuestionnairePoints.answerPoints[0] + QuestionnairePoints.answerPoints[1]
                    
                } else {
                    QuestionnairePoints.answerPoints.append(firstChoice.points)
                    let range = QuestionnairePoints.answerPoints.count - 1
                    QuestionnairePoints.answerPoints.removeSubrange(2..<range)
                    QuestionnairePoints.points = QuestionnairePoints.answerPoints[0] + QuestionnairePoints.answerPoints[1] + QuestionnairePoints.answerPoints[2]
                    
                }
            }
            
            // navigationController is a get property of this PageController, it can push a view controller onto the receiver’s stack and updates the display.
            navigationController?.pushViewController(pageController, animated: true)
        }
    }
    
    @objc func loadSecondChoice() {
        if let page = page, let secondChoice = page.secondChoice {
            let nextPage = secondChoice.page
            let pageController = PageController(page: nextPage)
            
            if let statusNumber = navigationController?.viewControllers.count {
                if statusNumber == 2 {
                    QuestionnairePoints.answerPoints.removeAll()
                    QuestionnairePoints.answerPoints.append(secondChoice.points)
                    QuestionnairePoints.points = secondChoice.points
                    
                } else if statusNumber == 3 {
                    QuestionnairePoints.answerPoints.append(secondChoice.points)
                    let range = QuestionnairePoints.answerPoints.count - 1
                    QuestionnairePoints.answerPoints.removeSubrange(1..<range)
                    QuestionnairePoints.points = QuestionnairePoints.answerPoints[0] + QuestionnairePoints.answerPoints[1]
                    
                } else {
                    QuestionnairePoints.answerPoints.append(secondChoice.points)
                    let range = QuestionnairePoints.answerPoints.count - 1
                    QuestionnairePoints.answerPoints.removeSubrange(2..<range)
                    QuestionnairePoints.points = QuestionnairePoints.answerPoints[0] + QuestionnairePoints.answerPoints[1] + QuestionnairePoints.answerPoints[2]
                    
                }
            }
            
            navigationController?.pushViewController(pageController, animated: true)
        }
    }
    
    @objc func loadThirdChoice() {
        if let page = page, let thirdChoice = page.thirdChoice {
            let nextPage = thirdChoice.page
            let pageController = PageController(page: nextPage)
            
            if let statusNumber = navigationController?.viewControllers.count {
                if statusNumber == 2 {
                    QuestionnairePoints.answerPoints.removeAll()
                    QuestionnairePoints.answerPoints.append(thirdChoice.points)
                    QuestionnairePoints.points = thirdChoice.points
                    
                } else if statusNumber == 3 {
                    QuestionnairePoints.answerPoints.append(thirdChoice.points)
                    let range = QuestionnairePoints.answerPoints.count - 1
                    QuestionnairePoints.answerPoints.removeSubrange(1..<range)
                    QuestionnairePoints.points = QuestionnairePoints.answerPoints[0] + QuestionnairePoints.answerPoints[1]
                    
                } else {
                    QuestionnairePoints.answerPoints.append(thirdChoice.points)
                    let range = QuestionnairePoints.answerPoints.count - 1
                    QuestionnairePoints.answerPoints.removeSubrange(2..<range)
                    QuestionnairePoints.points = QuestionnairePoints.answerPoints[0] + QuestionnairePoints.answerPoints[1] + QuestionnairePoints.answerPoints[2]
                    
                }
            }
            
            navigationController?.pushViewController(pageController, animated: true)
        }
    }
    
    @objc func loadFourthChoice() {
        if let page = page, let fourthChoice = page.fourthChoice {
            let nextPage = fourthChoice.page
            let pageController = PageController(page: nextPage)
            
            if let statusNumber = navigationController?.viewControllers.count {
                if statusNumber == 2 {
                    QuestionnairePoints.answerPoints.removeAll()
                    QuestionnairePoints.answerPoints.append(fourthChoice.points)
                    QuestionnairePoints.points = fourthChoice.points
                    
                } else if statusNumber == 3 {
                    QuestionnairePoints.answerPoints.append(fourthChoice.points)
                    let range = QuestionnairePoints.answerPoints.count - 1
                    QuestionnairePoints.answerPoints.removeSubrange(1..<range)
                    QuestionnairePoints.points = QuestionnairePoints.answerPoints[0] + QuestionnairePoints.answerPoints[1]
                    
                } else {
                    QuestionnairePoints.answerPoints.append(fourthChoice.points)
                    let range = QuestionnairePoints.answerPoints.count - 1
                    QuestionnairePoints.answerPoints.removeSubrange(2..<range)
                    QuestionnairePoints.points = QuestionnairePoints.answerPoints[0] + QuestionnairePoints.answerPoints[1] + QuestionnairePoints.answerPoints[2]
                    
                }
            }
            
            navigationController?.pushViewController(pageController, animated: true)
            
        }
    }
    
    @objc func startAgain() {
        navigationController?.popToRootViewController(animated: true)
        
    }
    
    
    
}






















