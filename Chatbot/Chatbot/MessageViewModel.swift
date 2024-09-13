//
//  MessageViewModel.swift
//  Chatbot
//
//  Created by aaron on 9/12/24.
//
import Foundation
import GoogleGenerativeAI

@MainActor class MessageViewModel: ObservableObject {
    @Published var messages: [Message] = []
    var prompt: String = ""
    var isLoading: Bool = false
    @Published var aiResponse: String = ""
    let model = GenerativeModel(name: "gemini-pro", apiKey: APIKey.default)
    
    func generateResponse(userPrompt: String) {
        isLoading = true
        messages.append(Message(text: userPrompt, isFromUser: true))
        
        Task {
            do {
                print("awaiting model")
                let result = try await model.generateContent(userPrompt)
                messages.append(Message(text: result.text ?? "No Response Found", isFromUser: false))
                self.isLoading = false
                self.aiResponse = result.text ?? "No response found"
                print(self.messages)
                print(self.aiResponse)
                
            }
            catch { isLoading = false }
        }
    }
    
}
