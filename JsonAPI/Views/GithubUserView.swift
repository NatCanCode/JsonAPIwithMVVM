//
//  GithubUserView.swift
//  JsonAPI
//
//  Created by N N on 27/09/2022.
//

import SwiftUI

//@StateObject private var GithubUserViewModel = GithubUserViewModel()

struct GithubUserView: View {
    
    @EnvironmentObject var userViewModel: GithubUserViewModel
    
    //    var isPressed = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Button {
                    Task {
                        userViewModel.user = try await userViewModel.getUser(username: userViewModel.usernameToSearch)
                    }
                } label: {
                    Text("Press me")
                        .foregroundColor(.white)
                    //                        .buttonStyle(GrowingButton())
                }
                .searchable(text: $userViewModel.usernameToSearch, placement:.navigationBarDrawer(displayMode: .always))
                .font(.title3)
                .fontWeight(.semibold)
                .padding()
                .background(.purple)
                .cornerRadius(30)
                
                Spacer()
                UserDetailView(user: userViewModel.user)
                Spacer()
            }
            .navigationTitle("GitHub Users")
            .padding()
        }
    }
}

struct GithubUserView_Previews: PreviewProvider {
    
    static var previews: some View {
        GithubUserView()
            .environmentObject(GithubUserViewModel())
    }
}
