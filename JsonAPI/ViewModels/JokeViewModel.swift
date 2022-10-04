//
//  JokeViewModel.swift
//  JsonAPI
//
//  Created by N N on 03/10/2022.
//

import Foundation

class JokeViewModel: ObservableObject {
    
    @Published var jokeText: String = ""
    
    //Async Await method
    func getRandomJoke() async throws -> String {
        guard let url = URL(string: "https://api.chucknorris.io/jokes/random")
        else {
            fatalError("Missing URL")
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200
        else {
            fatalError("Error while fetching data")
        }
        let decoded = try JSONDecoder().decode(Joke.self, from: data)
        let joke = decoded.value
        print("\(joke)")
        return joke }
}
