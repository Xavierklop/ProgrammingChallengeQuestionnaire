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
        
        if let page = page {
            
            let attributdString = NSMutableAttributedString(string: page.questionnaireChapter.text)
            
            let pargraphStyle = NSMutableParagraphStyle()
            pargraphStyle.lineSpacing = 10
            
            attributdString.addAttribute(NSAttributedStringKey.paragraphStyle, value: pargraphStyle, range: NSMakeRange(0, attributdString.length))
            
            questionLabel.attributedText = attributdString
            
            if let firstChoice = page.firstChoice {
                firstChoiceButton.setTitle(firstChoice.title, for: .normal)
            } else {
                firstChoiceButton.setTitle("Start Again", for: .normal)
            }
            
            if let secondChoice = page.secondChoice {
                secondChoiceButton.setTitle(secondChoice.title, for: .normal)
            }
            
            if let thirdChoice = page.thirdChoice {
                thirdChoiceButton.setTitle(thirdChoice.title, for: .normal)
            }
            
            if let fourthChoice = page.fourthChoice {
                fourthChoiceButton.setTitle(fourthChoice.title, for: .normal)
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
    

}






















