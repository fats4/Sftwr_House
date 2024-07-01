//
//  ProductView.swift
//  Sftwr_House
//
//  Created by FaTs on 02/07/24.
//

import SwiftUI

struct ProductView: View {
    var imageName: String
    var title: String
    var price: String
    @Binding var showPopup: Bool
    
    var body: some View {
        NavigationLink(destination: ProductDetailView(imageName: imageName, title: title, price: price, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", showPopup: $showPopup)) {
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                Text(title)
                    .font(.headline)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                Text(price)
                    .foregroundColor(.gray)
            }
        }
    }
}
