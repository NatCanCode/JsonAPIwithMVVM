//
//  ContentView.swift
//  JsonAPI
//
//  Created by N N on 27/09/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel : JokeViewModel
    @EnvironmentObject var userViewModel: GithubUserViewModel
    
    var body: some View {
        TabView {
            JokeView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Jokes")
                }
            GithubUserView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("GitHub users")
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(JokeViewModel())
            .environmentObject(GithubUserViewModel())
    }
}
