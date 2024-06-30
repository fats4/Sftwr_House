//
//  RegisterNextView.swift
//  Sftwr_House
//
//  Created by FaTs on 01/07/24.
//

import SwiftUI

struct RegisterNextView: View {
    @State private var fullName: String = ""
    @State private var selectedGender: String = ""
    @State private var birthDate: Date = Date()
    @State private var phoneNumber: String = ""
    @State private var showDatePicker: Bool = false
    
    let genders = ["Laki-laki", "Perempuan"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Spacer()
            Text("Nama Lengkap")
                .font(.headline)
            
            TextField("Masukkan nama lengkap anda", text: $fullName)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
            
            Text("Jenis kelamin")
                .font(.headline)
            
            CustomPicker(selectedOption: $selectedGender, options: genders, placeholder: "Jenis kelamin")
            
            Text("Tanggal lahir")
                .font(.headline)
            
            HStack {
                TextField("dd/mm/yyyy", text: Binding(
                    get: { formatDate(date: birthDate) },
                    set: { _ in }
                ))
                Image(systemName: "calendar")
                    .foregroundColor(.black)
                    .padding(.trailing , 10)
                
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .disabled(true)
            .onTapGesture {
                showDatePicker.toggle()
            }
            
            Text("Nomor Hp")
                .font(.headline)
            
            TextField("+62", text: $phoneNumber)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
            
            Spacer()
            
            VStack{
                NavigationLink(destination: MainView()) {
                        Text("Registrasi")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.yellow)
                            .cornerRadius(10)
                    }
                    .padding([.leading, .trailing], 118)
                }
                Spacer(minLength: 90)
            }
            
        
        .padding()
        .sheet(isPresented: $showDatePicker) {
            VStack {
                DatePicker(
                    "Tanggal lahir",
                    selection: $birthDate,
                    displayedComponents: .date
                )
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()
                
                Button("Done") {
                    showDatePicker.toggle()
                }
                .padding()
            }
        }
    }
    
    private func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }
}

struct RegisterNextView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterNextView()
    }
}
