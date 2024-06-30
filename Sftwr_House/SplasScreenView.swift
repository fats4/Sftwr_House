//
//  SplasScreenView.swift
//  Sftwr_House
//
//  Created by FaTs on 30/06/24.
//

import SwiftUI

struct SplashScreenView: View {
    @Binding var isSplashScreenActive: Bool
    
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image(systemName: "swift")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                Text("My SwiftUI App")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
            }
        }
        .onAppear {
            // Ubah durasi waktu splash screen di sini
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    isSplashScreenActive = false
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView(isSplashScreenActive: .constant(true))
    }
}
