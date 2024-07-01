//
//  CustomPicker.swift
//  Sftwr_House
//
//  Created by FaTs on 01/07/24.
//

import SwiftUI

struct CustomPicker: View {
    @Binding var selectedOption: String
    var options: [String]
    var placeholder: String
    
    @State private var showOptions = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Button(action: {
                showOptions.toggle()
            }) {
                HStack {
                    Text(selectedOption.isEmpty ? placeholder : selectedOption)
                        .foregroundColor(selectedOption.isEmpty ? .gray : .black)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
            }
            .sheet(isPresented: $showOptions) {
                VStack {
                    Text("Pilih Jenis Kelamin")
                        .font(.headline)
                        .padding()
                    List {
                        ForEach(options, id: \.self) { option in
                            Text(option)
                                .onTapGesture {
                                    selectedOption = option
                                    showOptions = false
                                }
                        }
                    }
                }
            }
        }
    }
}
