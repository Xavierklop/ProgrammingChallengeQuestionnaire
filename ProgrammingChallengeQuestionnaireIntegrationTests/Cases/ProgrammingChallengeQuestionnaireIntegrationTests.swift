//
//  ProgrammingChallengeQuestionnaireIntegrationTests.swift
//  ProgrammingChallengeQuestionnaireIntegrationTests
//
//  Created by Hao Wu on 2018/8/10.
//  Copyright © 2018年 Hao Wu. All rights reserved.
//

import XCTest
@testable import ProgrammingChallengeQuestionnaire

class ProgrammingChallengeQuestionnaireIntegrationTests: XCTestCase {
    
    var client: HUMAPIClient!
    
    override func setUp() {
        super.setUp()
        client = HUMAPIClient()
    }
    
    func testGetSomeStringDataFails() {
        
        // give
        let expectation = self.expectation(description: "Expected get data from server to fails")
        
        // when
        
        
        
        // then
        
    }
    
}
