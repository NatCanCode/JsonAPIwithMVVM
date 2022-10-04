//
//  JsonAPIApp.swift
//  JsonAPI
//
//  Created by N N on 27/09/2022.
//

import SwiftUI

@main
struct JsonAPIApp: App {
    @StateObject var myJoke = JokeViewModel()
    @StateObject var userViewModel = GithubUserViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(myJoke)
                .environmentObject(userViewModel)
        }
    }
}
