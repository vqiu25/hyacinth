//
//  hyacinthApp.swift
//  hyacinth
//
//  Created by Victor Esther Qiu on 5/01/24.
//

import SwiftUI

@main
struct hyacinthApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView(tasks: TaskModel.sampleData)
        }
    }
}
