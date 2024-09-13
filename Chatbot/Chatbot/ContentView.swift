//
//  ContentView.swift
//  Chatbot
//
//  Created by aaron on 9/11/24.
//

import SwiftUI


struct ContentView: View {

    @StateObject var messageVM = MessageViewModel()
    @State var userPrompt: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            Text(messageVM.prompt)
            Text(messageVM.aiResponse)
            Spacer()
                HStack {
                    TextField("Hello Gemini", text: $userPrompt)
                        .lineLimit(5)
                        .onSubmit {
                            updateResponse()
                        }
                    Button("Send") {
                        updateResponse()
                    }
                }
        }
        .padding()
    }
    
    func updateResponse() {
        messageVM.prompt = userPrompt
        messageVM.generateResponse(userPrompt: userPrompt)
        userPrompt = ""
    }
    

    
}

#Preview {
    ContentView()
}
