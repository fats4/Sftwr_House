//
//  RegisterView.swift
//  Sftwr_House
//
//  Created by FaTs on 01/07/24.
//

import SwiftUI

struct RegisterView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            Spacer()
    
            VStack(spacing: 20) {
                HStack {
                    Image(systemName: "envelope")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 35)
                        .foregroundColor(.gray)
                        .padding(.leading , 20)

                    
                    TextField("Masukkan email anda", text: $email)
                        .padding()
                        
                }
                .background(Color("Lunas"))
                .cornerRadius(15) // Tambahkan cornerRadius di sini
                        

                HStack {
                    Image(systemName: "lock")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 21, height: 25)
                        .foregroundColor(.gray)
                        .padding(.leading , 20)
                    SecureField("Masukkan kata sandi anda", text: $password)
                        .padding()
                }
                .background(Color("Lunas"))
                .cornerRadius(15) // Tambahkan cornerRadius di sini
                
                HStack {
                    Image(systemName: "lock")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 21, height: 25)
                        .foregroundColor(.gray)
                        .padding(.leading , 20)
                    SecureField("Masukkan kata sandi anda", text: $password)
                        .padding()
                }
                .background(Color("Lunas"))
                .cornerRadius(15) // Tambahkan cornerRadius di sini

            }
            .padding([.leading, .trailing, .bottom], 27.5)
            
            NavigationLink(destination: RegisterNextView()) {
                Text("Selanjutnya")
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(width: 200, height: 50)
                    .background(Color.yellow)
                    .cornerRadius(10)
            }
            
            Spacer(minLength: 270)
            
            HStack {
                Text("Sudah punya akun?")
                    .foregroundColor(.black)
                NavigationLink(destination: LoginView()) {
                    Text("Masuk")
                    .foregroundColor(Color.yellow)
                }
            }
            .padding(.bottom, 20)
        }
        .navigationTitle("Registrasi")
        NavigationLink(destination: MainView()){
            
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
