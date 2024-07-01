//
//  CustomTabBar.swift
//  Sftwr_House
//
//  Created by FaTs on 02/07/24.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Tab

    var body: some View {
        HStack {
            Spacer()
            VStack {
                Image(systemName: "house.fill")
                    .foregroundColor(selectedTab == .home ? .blue : .gray)
                    .onTapGesture {
                        selectedTab = .home
                    }
            }
            Spacer()
            VStack {
                Image(systemName: "square.grid.2x2")
                    .foregroundColor(selectedTab == .categories ? .blue : .gray)
                    .onTapGesture {
                        selectedTab = .categories
                    }
            }
            Spacer()
            VStack {
                Image(systemName: "bell")
                    .foregroundColor(selectedTab == .notifications ? .blue : .gray)
                    .onTapGesture {
                        selectedTab = .notifications
                    }
            }
            Spacer()
            VStack {
                Image(systemName: "person.crop.circle")
                    .foregroundColor(selectedTab == .profile ? .blue : .gray)
                    .onTapGesture {
                        selectedTab = .profile
                    }
            }
            Spacer()
        }
        .padding()
        .background(Color.white)
        .shadow(radius: 2)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.home))
    }
}
