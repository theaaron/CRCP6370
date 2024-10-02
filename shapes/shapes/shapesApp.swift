//
//  shapesApp.swift
//  shapes
//
//  Created by aaron on 9/29/24.
//

import SwiftUI

@main
struct shapesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
        ImmersiveSpace(id: "immersive") {
            ImmersiveView()
        }
        .immersionStyle(selection: .constant(.full), in: .full)
        
    }
}
