//
//  SplashScreenView.swift
//  Sftwr_House
//
//  Created by FaTs on 01/07/24.
//

import SwiftUI

struct SplashScreenView: View {
    @Binding var isSplashScreenActive: Bool
    
    var body: some View {
        ZStack {
            Color.utama
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("Splash")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 220)
            }
        }
        .onAppear {
            // Ubah durasi waktu splash screen di sini
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
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
