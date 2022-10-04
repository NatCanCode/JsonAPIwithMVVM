//
//  GithubUser.swift
//  JsonAPI
//
//  Created by N N on 03/10/2022.
//

import Foundation

struct User: Identifiable, Codable {
    let login: String
    let id: Int
    let repositories: Int
    let avatarURL: String
    let bio: String
    
    enum CodingKeys: String, CodingKey {
        case login
        case id
        case repositories = "public_repos"
        case avatarURL = "avatar_url"
        case bio
    }
}
