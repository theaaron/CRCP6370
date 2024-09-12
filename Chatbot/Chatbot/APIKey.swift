//
//  APIKey.swift
//  Chatbot
//
//  Created by aaron on 9/12/24.
//
import Foundation

enum APIKey {
    static var `default`: String {
        guard let filePath = Bundle.main.path(forResource: "GenAI-Info", ofType: "plist")
        else {
            fatalError("Couldn't find file 'GenAI-Info.plist'")
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        
        guard let value = plist?.object(forKey: "API_KEY") as? String else {
            fatalError("Couldn't find key 'API_KEY' in 'GenAI-Info.plist'")
        }
        if value.starts(with: "_") {
            fatalError("Follow the instructions at https://ai.google.dev/tutorials/setup to get your API key")
        }
        return value
        
    }
}
