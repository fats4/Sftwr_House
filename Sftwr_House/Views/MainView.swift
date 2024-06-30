//
//  MainView.swift
//  Sftwr_House
//
//  Created by FaTs on 01/07/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            VStack {
                
                Spacer(minLength: 180)
                
                
                Image("LogoMain")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                
                Text("Selamat datang")
                    .font(.title)
                    .padding(.top, 20)
                
                Text("Belanja dengan percaya diri, karena kami menawarkan berbagai metode pembayaran yang aman dan terjamin.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding([.leading, .trailing], 20)
                    .padding(.top, 10)
                
                Spacer()
                
                NavigationLink(destination: LoginView()) {
                    Text("Masuk")
                        .font(.headline)
                        .foregroundColor(.black)
                        .frame(width: 200, height: 50)
                        .background(Color.yellow)
                        .cornerRadius(10)
                }
                .padding(.bottom, 10)
                
                NavigationLink(destination: RegisterView()) {
                    Text("Registrasi")
                        .font(.headline)
                        .foregroundColor(.black)
                        .frame(width: 200, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 2)
                        )
                }
                Spacer(minLength: 170)
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
