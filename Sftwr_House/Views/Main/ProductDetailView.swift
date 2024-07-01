import SwiftUI

struct ProductDetailView: View {
    var imageName: String
    var title: String
    var price: String
    var description: String
    @Binding var showPopup: Bool

    @State private var isExpanded = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    ZStack(alignment: .topLeading) {
                        Image(imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width, height: geometry.safeAreaInsets.top + 500)
                            .clipped()

                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "arrow.left")
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.yellow)
                                .cornerRadius(10)
                                .padding(.leading, 20) // Padding kiri
                                .padding(.top, 55) // Padding atas yang berbeda
                        }
                    }
                    .background(Color("GreyFillForm"))

                    VStack(alignment: .leading, spacing: 5) {
                        Text("AKSESORIS")
                            .padding(.top, 12)
                            .font(.footnote)
                            .foregroundColor(.gray)
                        Text(title)
                            .font(.title2)
                            .fontWeight(.bold)

                        if isExpanded {
                            ScrollView {
                                Text(description)
                                    .foregroundColor(.black)
                                    .font(.body)
                                    .onTapGesture {
                                        withAnimation {
                                            isExpanded.toggle()
                                        }
                                    }
                            }
                            .frame(maxHeight: 500)
                        } else {
                            Text(String(description.prefix(100)) + "... Baca selengkapnya")
                                .foregroundColor(.black)
                                .font(.body)
                                .onTapGesture {
                                    withAnimation {
                                        isExpanded.toggle()
                                    }
                                }
                        }

                        Spacer()

                        HStack {
                            VStack(alignment: .leading) {
                                Text("HARGA")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                                Text(price)
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }

                            Spacer()

                            Button(action: {
                                showPopup = true
                                presentationMode.wrappedValue.dismiss()
                            }) {
                                HStack {
                                    Text("+ Keranjang")
                                        .foregroundColor(.black)
                                        .padding(.vertical, 10)
                                        .padding(.horizontal, 20)
                                }
                                .background(Color.yellow)
                                .cornerRadius(20)
                            }
                        }
                        .padding()
                        .background(Color.black) // Menambahkan background hitam pada HStack
                        .cornerRadius(20)

                        Spacer()
                    }
                    .padding([.leading, .trailing, .bottom])

                    Spacer()
                }
            }
        }
        .edgesIgnoringSafeArea(.top) // Menambahkan ini agar gambar menembus notification bar
        .navigationBarBackButtonHidden(true)
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(imageName: "Headphone", title: "Headphone JBL Black Mercury", price: "Rp. 100.000", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", showPopup: .constant(false))
    }
}
