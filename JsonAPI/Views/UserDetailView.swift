//
//  UserDetaiView.swift
//  JsonAPI
//
//  Created by N N on 03/10/2022.
//

import SwiftUI

struct UserDetailView: View {
    var user: User
    var body: some View {
       
        VStack {
            Text(user.login)
                .font(.title)
                .fontWeight(.semibold)
            .padding()
            
            Text("\(user.repositories) public repositories")
                .padding()
            
            AsyncImage(url: URL(string: user.avatarURL)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
//                            .clipShape(Circle())
                        .frame(width: 300, height: 300)
                case .failure:
                    Image(systemName: "multiply")
                @unknown default:
                    Image(systemName: "plus")
                }
            }
            Text(user.bio)
                .padding()
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(user: User(login: "NatCanCode", id: 0, repositories: 2, avatarURL: "https://avatars.githubusercontent.com/u/63366733?v=4", bio: "Code is fun - most of the time^"))
    }
}
