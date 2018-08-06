//
//  ViewController.swift
//  ProgrammingChallengeQuestionnaire
//
//  Created by Hao Wu on 2018/8/4.
//  Copyright © 2018年 Hao Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startQuestionnaire" {
            // Downcasting
            guard let pageController = segue.destination as? PageController else {
                return }
            
            // Note: because in fact we don't use PageController's init method assign the property page, so do this in prepare(for segue:, sender:).
            pageController.page = Questionnaire.questionnaireLinedLists
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}

