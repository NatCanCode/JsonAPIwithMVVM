//
//  JokeView.swift
//  JsonAPI
//
//  Created by N N on 27/09/2022.
//

import SwiftUI

//@StateObject private var JokeViewModel = JokeViewModel()


struct JokeView: View {
    
    @EnvironmentObject var myJoke: JokeViewModel
//    @State private var joke: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Button {
                    Task {
                        myJoke.jokeText = try await myJoke.getRandomJoke()
                    }
                } label: {
                    HStack {
                        Text("Ready for a random joke?")
//                        Image(systemName: "shuffle")
                    }
                    .foregroundColor(.white)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding()
                    .background(.purple)
                    .cornerRadius(30)
                }
                .padding()
                Spacer()
                Text(myJoke.jokeText)
                    .font(.title3)
                    .padding()
                Spacer()
            }
            .navigationTitle("Chuck Norris Jokes")
        }
    }
}

struct JokeView_Previews: PreviewProvider {
    static var previews: some View {
        JokeView()
            .environmentObject(JokeViewModel())
    }
}
