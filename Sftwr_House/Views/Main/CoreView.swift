//
//  CoreView.swift
//  Sftwr_House
//
//  Created by FaTs on 02/07/24.
//

import SwiftUI

struct CoreView: View {
    @State private var selectedTab: Tab = .home

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    switch selectedTab {
                    case .home:
                        HomeView()
                    case .categories:
                        CategoriesView()
                    case .notifications:
                        NotificationsView()
                    case .profile:
                        ProfileView()
                    }

                    Spacer()

                    CustomTabBar(selectedTab: $selectedTab)
                }
            }
            .navigationBarHidden(true)
        }
        .navigationBarBackButtonHidden(true)
    }
}

enum Tab {
    case home
    case categories
    case notifications
    case profile
}

struct CoreView_Previews: PreviewProvider {
    static var previews: some View {
        CoreView()
    }
}

