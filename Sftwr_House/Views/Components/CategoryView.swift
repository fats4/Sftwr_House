//
//  CategoryView.swift
//  Sftwr_House
//
//  Created by FaTs on 02/07/24.
//

import SwiftUI

struct CategoryView: View {
    var imageName: String
    var title: String
    var isSelected: Bool
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .foregroundColor(isSelected ? .black : .black)
                .frame(width: 65, height: 65)
                .background(isSelected ? Color.yellow : Color("Lunas"))
                .cornerRadius(10)
            Text(title)
                .font(.caption2)
                .foregroundColor(isSelected ? .black : .gray)
        }
    }
}
