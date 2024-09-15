//
//  ContentView.swift
//  Chatbot
//
//  Created by aaron on 9/11/24.
//

import SwiftUI


struct ContentView: View {
    let gradColors: [Color] = [Color(NSColor(red: 0.1, green: 0.05, blue: 0.5, alpha: 1.0)),
                               Color(NSColor(red: 0.3, green: 0.05, blue: 0.5, alpha: 1.0))]
    let globeColors: [Color] = [Color(NSColor(red: 0.2, green: 0.1, blue: 0.9, alpha: 1.0)),
                               Color(NSColor(red: 0.6, green: 0.1, blue: 0.9, alpha: 1.0))]
    
    @StateObject var messageVM = MessageViewModel()
    @State var userPrompt: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            ConversationView(messageVM: messageVM, gradColors: gradColors, globeColors: globeColors, prompt: userPrompt)
            Spacer()
                HStack {
                    TextField("Hello Gemini", text: $userPrompt)
                        .lineLimit(5)
                        .onSubmit {
                            if userPrompt != "" {
                                updateResponse()
                            }
                        }
                    Button("Send") {
                        if userPrompt != "" {
                            updateResponse()
                        }
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

struct ConversationView: View {
    let messageVM: MessageViewModel
    let gradColors: [Color]
    let globeColors: [Color]
    let prompt: String
    var body: some View {
        VStack {
            if messageVM.aiResponse == "" {
                Image(systemName: "globe")
                    .font(.largeTitle)
                    .foregroundStyle(LinearGradient(colors: globeColors, startPoint: .bottom, endPoint: .top))
            } else {
                Text(messageVM.prompt)
                    .padding()
                    .cornerRadius(10)
                    .background()
                Text(messageVM.aiResponse)
                    .padding()
                    .background(LinearGradient(colors: gradColors, startPoint: .bottomLeading, endPoint: .topTrailing))
            }
            
        }
    }
}

#Preview {
    ContentView()
}
