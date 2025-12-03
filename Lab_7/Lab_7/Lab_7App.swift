//
//  Lab_7App.swift
//  Lab_7
//
//  Created by Jarne Adam on 03/12/2025.
//

import SwiftUI

@main
struct Lab_7App: App {
    @State var appData = AppData()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(appData)
        }
    }
}
