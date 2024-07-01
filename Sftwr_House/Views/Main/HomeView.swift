//
//  HomeView.swift
//  Sftwr_House
//
//  Created by FaTs on 01/07/24.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedCategory = "Semua"
    @State private var showPopup = false

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Spacer(minLength: 20)
                    HStack {
                        Text("Selamat datang, Libur")
                            .fontWeight(.heavy)
                            .padding(.leading, 25)
                        Spacer()
                    }
                    Spacer(minLength: 25)

                    HStack {
                        TextField("Cari di sini", text: .constant(""))
                            .padding(.leading, 15)
                        HStack {
                            Image(systemName: "magnifyingglass")
                        }
                        .padding(.trailing, 15)
                    }
                    .frame(height: 40)
                    .background(Color("Lunas"))
                    .cornerRadius(20)
                    .padding(.horizontal, 25)
                    .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                    Spacer(minLength: 25)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 24.0) {
                            Button(action: {
                                selectedCategory = "Semua"
                            }) {
                                CategoryView(imageName: "square.grid.2x2", title: "Semua", isSelected: selectedCategory == "Semua")
                            }
                            Button(action: {
                                selectedCategory = "Komputer"
                            }) {
                                CategoryView(imageName: "desktopcomputer", title: "Komputer", isSelected: selectedCategory == "Komputer")
                            }
                            Button(action: {
                                selectedCategory = "Hardware"
                            }) {
                                CategoryView(imageName: "cpu", title: "Hardware", isSelected: selectedCategory == "Hardware")
                            }
                            Button(action: {
                                selectedCategory = "Aksesoris"
                            }) {
                                CategoryView(imageName: "headphones", title: "Aksesoris", isSelected: selectedCategory == "Aksesoris")
                            }
                        }
                        .padding(.horizontal, 30)
                    }
                    Spacer(minLength: 30)

                    HStack {
                        Text("Produk tersedia")
                            .font(.body)
                            .padding(.leading, 25)
                        Spacer()
                    }
                    Spacer(minLength: 10)

                    ScrollView {
                        if selectedCategory == "Komputer" {
                            VStack(spacing: 20) {
                                ForEach(0..<2) { _ in
                                    HStack(spacing: 15) {
                                        ProductView(imageName: "Komputer", title: "Lenovo Dekstop", price: "Rp. 20.000", showPopup: $showPopup)
                                        ProductView(imageName: "Komputer1", title: "ThinkCentre M720", price: "Rp. 20.000", showPopup: $showPopup)
                                    }
                                }
                            }
                            .padding()
                        } else if selectedCategory == "Hardware" {
                            // Add your hardware products here
                            VStack(spacing: 20) {
                                ForEach(0..<2) { _ in
                                    HStack(spacing: 15) {
                                        ProductView(imageName: "Hardware", title: "Hardware Product 1", price: "Rp. 20.000", showPopup: $showPopup)
                                        ProductView(imageName: "Hardware", title: "Hardware Product 2", price: "Rp. 20.000", showPopup: $showPopup)
                                    }
                                }
                            }
                            .padding()
                        } else if selectedCategory == "Aksesoris" {
                            // Add your accessories products here
                            VStack(spacing: 20) {
                                ForEach(0..<2) { _ in
                                    HStack(spacing: 15) {
                                        ProductView(imageName: "Headphone", title: "Headphone JBL Back Mercury", price: "Rp. 20.000", showPopup: $showPopup)
                                        ProductView(imageName: "Headphone", title: "Headphone JBL Back Mercury", price: "Rp. 20.000", showPopup: $showPopup)
                                    }
                                }
                            }
                            .padding()
                        } else { // Semua
                            VStack(spacing: 20) {
                                ForEach(0..<2) { _ in
                                    HStack(spacing: 15) {
                                        ProductView(imageName: "Komputer", title: "Lenovo Dekstop", price: "Rp. 20.000", showPopup: $showPopup)
                                        ProductView(imageName: "Komputer1", title: "ThinkCentre M720", price: "Rp. 20.000", showPopup: $showPopup)
                                    }
                                }
                                ForEach(0..<2) { _ in
                                    HStack(spacing: 15) {
                                        ProductView(imageName: "Headphone", title: "Headphone JBL Back Mercury", price: "Rp. 20.000", showPopup: $showPopup)
                                        ProductView(imageName: "Headphone", title: "Headphone JBL Back Mercury", price: "Rp. 20.000", showPopup: $showPopup)
                                    }
                                }
                                // Add more products for other categories if needed
                            }
                            .padding()
                        }
                    }

                    Spacer()

                    CustomTabBar()
                }
                .navigationBarHidden(true)

                // Pop-up overlay
                if showPopup {
                    VStack {
                        Spacer()
                        VStack {
                            Image("Keranjang")
                                .resizable()
                                .frame(width: 150, height: 150)
                                .padding()
                            Text("Barang berhasil ditambahkan ke keranjang. Cek menu keranjang untuk melihat pesanan anda.")
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                        }
                        .frame(width: 300, height: 300)
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                        .padding(.bottom, 50)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.4).edgesIgnoringSafeArea(.all))
                    .onTapGesture {
                        showPopup = false
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

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


struct CustomTabBar: View {
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Image(systemName: "house.fill")
            }
            Spacer()
            VStack {
                Image(systemName: "square.grid.2x2")
            }
            Spacer()
            VStack {
                Image(systemName: "bell")
            }
            Spacer()
            VStack {
                Image(systemName: "person.crop.circle")
            }
            Spacer()
        }
        .padding()
        .background(Color.white)
        .shadow(radius: 2)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
