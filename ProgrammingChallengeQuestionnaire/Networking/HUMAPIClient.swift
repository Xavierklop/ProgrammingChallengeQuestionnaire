//
//  HUMAPIClient.swift
//  ProgrammingChallengeQuestionnaire
//
//  Created by Hao Wu on 2018/8/7.
//  Copyright © 2018年 Hao Wu. All rights reserved.
//

import Foundation

// A demo HUMAPIClient try to "download" someStringData json from server but which NOT implemented in viewController!
class HUMAPIClient {
    
    fileprivate let demoHUMApiKey = "123455678909876544356771231212121212121"
    
    lazy var baseUrl: URL = {
        return URL(string: "https://api.hum.com/xxxxxxxx/\(self.demoHUMApiKey)/")!
    }()
    
    let decoder = JSONDecoder()
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    func getDataFromServer(completion: ((Bool) -> ())?) {
        
    }
    
    func getSomeStringData(someInfo: String, completionHandler completion: @escaping (NetworkDemoData?, Error?) -> Void) {

        guard let url = URL(string: someInfo, relativeTo: baseUrl) else {
            completion(nil, HUMError.someError)
            return
        }

        let request = URLRequest(url: url)

        let task = session.dataTask(with: request) { data, response, error in
            // Since the download takes place in the background thread, it needs to be returned to the main thread, so that the update UI is guaranteed to happen on the main thread (although I don't know how to use "mock" to write a unit test, the update UI is not implemented in the viewController).
            DispatchQueue.main.async {
                if let data = data {
                    guard let httpResponse = response as? HTTPURLResponse else {
                        completion(nil, HUMError.someError)
                        return
                    }
                    if httpResponse.statusCode == 200 {
                        do {
                            let networkDemoData = try self.decoder.decode(NetworkDemoData.self, from: data)
                            completion(networkDemoData, nil)
                        } catch let error {
                            completion(nil, error)
                        }
                    } else {
                        completion(nil, HUMError.someError)
                    }


                } else if let error = error {
                    completion(nil, error)
                }
            }

        }

        task.resume()

    }
    
}
























