//
//  PageController.swift
//  ProgrammingChallengeQuestionnaire
//
//  Created by Hao Wu on 2018/8/5.
//  Copyright © 2018年 Hao Wu. All rights reserved.
//

import UIKit

class PageController: UIViewController {
    
    var page: Page?
    
    // MARK: - User Interface Properties
    
    let questionLabel = UILabel()
    let firstChoiceButton = UIButton(type: .system)
    let secondChoiceButton = UIButton(type: .system)
    let thirdChoiceButton = UIButton(type: .system)
    let fourthChoiceButton = UIButton(type: .system)
    
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
        
        if let page = page {
            
            let attributdString = NSMutableAttributedString(string: page.questionnaireChapter.text)
            
            let pargraphStyle = NSMutableParagraphStyle()
            pargraphStyle.lineSpacing = 10
            
            attributdString.addAttribute(NSAttributedStringKey.paragraphStyle, value: pargraphStyle, range: NSMakeRange(0, attributdString.length))
            
            questionLabel.attributedText = attributdString
            
            if let firstChoice = page.firstChoice {
                firstChoiceButton.setTitle(firstChoice.title, for: .normal)
                // Selector(a pointer) is a link to the method name that we want to call or a name used to select a method to execute for an object.
                firstChoiceButton.addTarget(self, action: #selector(PageController.loadFirstChoice), for: .touchUpInside)
            } else {
                firstChoiceButton.setTitle("Start Again", for: .normal)
                firstChoiceButton.addTarget(self, action: #selector(PageController.startAgain), for: .touchUpInside)
            }
            
            if let secondChoice = page.secondChoice {
                secondChoiceButton.setTitle(secondChoice.title, for: .normal)
                secondChoiceButton.addTarget(self, action: #selector(PageController.loadSecondChoice), for: .touchUpInside)
            }
            
            if let thirdChoice = page.thirdChoice {
                thirdChoiceButton.setTitle(thirdChoice.title, for: .normal)
                thirdChoiceButton.addTarget(self, action: #selector(PageController.loadThirdChoice), for: .touchUpInside)
            }
            
            if let fourthChoice = page.fourthChoice {
                fourthChoiceButton.setTitle(fourthChoice.title, for: .normal)
                fourthChoiceButton.addTarget(self, action: #selector(PageController.loadFourthChoice), for: .touchUpInside)
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        view.addSubview(questionLabel)
        questionLabel.numberOfLines = 0
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
            questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0),
            questionLabel.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -48.0)
            ])
        
        view.addSubview(firstChoiceButton)
        firstChoiceButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            firstChoiceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstChoiceButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -176)
            ])
        
        view.addSubview(secondChoiceButton)
        secondChoiceButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            secondChoiceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondChoiceButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -128)
            ])
        
        view.addSubview(thirdChoiceButton)
        thirdChoiceButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            thirdChoiceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            thirdChoiceButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80.0)
            ])
        
        view.addSubview(fourthChoiceButton)
        fourthChoiceButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            fourthChoiceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fourthChoiceButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32)
            ])
        
        
    }
    
    @objc func loadFirstChoice() {
        if let page = page, let firstChoice = page.firstChoice {
            let nextPage = firstChoice.page
            // Remember we use view controller manage view.
            let pageController = PageController(page: nextPage)
            
            // test
            if let statusNumber = navigationController?.viewControllers.count {
                if statusNumber == 2 {
                    QuestionnairePoints.answerPoints.removeAll()
                    QuestionnairePoints.answerPoints.append(firstChoice.points)
                    QuestionnairePoints.points = firstChoice.points
                    print(QuestionnairePoints.points)
                    
                } else if statusNumber == 3 {
                    QuestionnairePoints.answerPoints.append(firstChoice.points)
                    let range = QuestionnairePoints.answerPoints.count - 1
                    QuestionnairePoints.answerPoints.removeSubrange(1..<range)
                    QuestionnairePoints.points = QuestionnairePoints.answerPoints[0] + QuestionnairePoints.answerPoints[1]
                    print("Q2")
                    print(QuestionnairePoints.points)
                    
                } else {
                    QuestionnairePoints.answerPoints.append(firstChoice.points)
                    let range = QuestionnairePoints.answerPoints.count - 1
                    QuestionnairePoints.answerPoints.removeSubrange(2..<range)
                    QuestionnairePoints.points = QuestionnairePoints.answerPoints[0] + QuestionnairePoints.answerPoints[1] + QuestionnairePoints.answerPoints[2]
                    print("Q3")
                    print(QuestionnairePoints.points)
                    
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
            
            // test
            if let statusNumber = navigationController?.viewControllers.count {
                if statusNumber == 2 {
                    QuestionnairePoints.answerPoints.removeAll()
                    QuestionnairePoints.answerPoints.append(secondChoice.points)
                    QuestionnairePoints.points = secondChoice.points
                    print(QuestionnairePoints.points)
                    
                } else if statusNumber == 3 {
                    QuestionnairePoints.answerPoints.append(secondChoice.points)
                    let range = QuestionnairePoints.answerPoints.count - 1
                    QuestionnairePoints.answerPoints.removeSubrange(1..<range)
                    QuestionnairePoints.points = QuestionnairePoints.answerPoints[0] + QuestionnairePoints.answerPoints[1]
                    print("Q2")
                    print(QuestionnairePoints.points)
                    
                } else {
                    QuestionnairePoints.answerPoints.append(secondChoice.points)
                    let range = QuestionnairePoints.answerPoints.count - 1
                    QuestionnairePoints.answerPoints.removeSubrange(2..<range)
                    QuestionnairePoints.points = QuestionnairePoints.answerPoints[0] + QuestionnairePoints.answerPoints[1] + QuestionnairePoints.answerPoints[2]
                    print("Q3")
                    print(QuestionnairePoints.points)
                    
                }
            }
            
            navigationController?.pushViewController(pageController, animated: true)
        }
    }
    
    @objc func loadThirdChoice() {
        if let page = page, let thirdChoice = page.thirdChoice {
            let nextPage = thirdChoice.page
            let pageController = PageController(page: nextPage)
            
            // test
            if let statusNumber = navigationController?.viewControllers.count {
                if statusNumber == 2 {
                    QuestionnairePoints.answerPoints.removeAll()
                    QuestionnairePoints.answerPoints.append(thirdChoice.points)
                    QuestionnairePoints.points = thirdChoice.points
                    print(QuestionnairePoints.points)
                    
                } else if statusNumber == 3 {
                    QuestionnairePoints.answerPoints.append(thirdChoice.points)
                    let range = QuestionnairePoints.answerPoints.count - 1
                    QuestionnairePoints.answerPoints.removeSubrange(1..<range)
                    QuestionnairePoints.points = QuestionnairePoints.answerPoints[0] + QuestionnairePoints.answerPoints[1]
                    print("Q2")
                    print(QuestionnairePoints.points)
                    
                } else {
                    QuestionnairePoints.answerPoints.append(thirdChoice.points)
                    let range = QuestionnairePoints.answerPoints.count - 1
                    QuestionnairePoints.answerPoints.removeSubrange(2..<range)
                    QuestionnairePoints.points = QuestionnairePoints.answerPoints[0] + QuestionnairePoints.answerPoints[1] + QuestionnairePoints.answerPoints[2]
                    print("Q3")
                    print(QuestionnairePoints.points)
                    
                }
            }
            
            navigationController?.pushViewController(pageController, animated: true)
        }
    }
    
    @objc func loadFourthChoice() {
        if let page = page, let fourthChoice = page.fourthChoice {
            let nextPage = fourthChoice.page
            let pageController = PageController(page: nextPage)
            
            // test
            if let statusNumber = navigationController?.viewControllers.count {
                if statusNumber == 2 {
                    QuestionnairePoints.answerPoints.removeAll()
                    QuestionnairePoints.answerPoints.append(fourthChoice.points)
                    QuestionnairePoints.points = fourthChoice.points
                    print(QuestionnairePoints.points)
                    
                } else if statusNumber == 3 {
                    QuestionnairePoints.answerPoints.append(fourthChoice.points)
                    let range = QuestionnairePoints.answerPoints.count - 1
                    QuestionnairePoints.answerPoints.removeSubrange(1..<range)
                    QuestionnairePoints.points = QuestionnairePoints.answerPoints[0] + QuestionnairePoints.answerPoints[1]
                    print("Q2")
                    print(QuestionnairePoints.points)
                    
                } else {
                    QuestionnairePoints.answerPoints.append(fourthChoice.points)
                    let range = QuestionnairePoints.answerPoints.count - 1
                    QuestionnairePoints.answerPoints.removeSubrange(2..<range)
                    QuestionnairePoints.points = QuestionnairePoints.answerPoints[0] + QuestionnairePoints.answerPoints[1] + QuestionnairePoints.answerPoints[2]
                    print("Q3")
                    print(QuestionnairePoints.points)
                    
                }
            }
            
            navigationController?.pushViewController(pageController, animated: true)
            
        }
    }
    
    @objc func startAgain() {
        
        print(QuestionnairePoints.points)
        navigationController?.popToRootViewController(animated: true)
        
    }
    
    
    
}






















