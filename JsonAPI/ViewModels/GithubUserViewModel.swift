//
//  GithubUserViewModel.swift
//  JsonAPI
//
//  Created by N N on 03/10/2022.
//

import Foundation


class GithubUserViewModel: ObservableObject {
    
    @Published var user = User(login: "", id: 0, repositories: 0, avatarURL: "", bio: "")
    
    @Published var usernameToSearch = ""
    
    //Async Await method
    func getUser(username: String) async throws -> User {
        guard let url = URL(string: "https://api.github.com/users/\(username)")
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
        let decoded = try JSONDecoder().decode(User.self, from: data)
        return decoded
    }
}

