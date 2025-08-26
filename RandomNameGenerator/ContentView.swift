//
//  ContentView.swift
//  RandomNameGenerator
//
//  Created by Paul Naranja on 8/22/25.
//

import SwiftUI

struct ContentView: View {
    @State private var currentText = "Paul"
    private let names = ["Adam", "Bob", "Jennifer", "Mae", "Paul"]

    func randomName() -> String{
        let temp = names.randomElement()
        return names.randomElement() ?? "Paul"
    }

    var body: some View {
        HStack(spacing: 0) {
            VStack(spacing: 10 /*spacing between each major element in the Vstack*/) {
                Button(action: {
                    // Add your home button action here
                }) {
                    HStack {
                        Image(systemName: "house.fill")
                            .foregroundColor(.black)
                        Text("Home")
                            .foregroundColor(.black)
                            .font(.system(size: 14))
                    }
                }
                .buttonStyle(.bordered)
                .frame(width: 120, height: 40, alignment: .leading)  //size of the frame of the button.  Leading alignment to align to the left

                Button(action: {
                    // Add your favorites button action here
                }) {
                    HStack {
                        Image(systemName: "house.fill")
                            .foregroundColor(.black)
                        Text("Favorites")
                            .foregroundColor(.black)
                            .font(.system(size: 14))
                    }
                }
                .buttonStyle(.bordered)
                .frame(width: 120, height: 40, alignment: .leading)  //size of the frame of the button.  Leading alignment to align to the left

                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width * 0.35)
            .background(Color.white)
            .padding(.top, 20)
            .padding(.leading, 20)

            VStack(spacing: 20) {
                Spacer()
                Text(currentText)
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold))
                    .padding(.horizontal, 30)  // Adds more horizontal spacing
                    .padding(.vertical, 15)  // Adds more vertical spacing
                    .background(Color.blue.opacity(10.0))
                    .cornerRadius(8)
                HStack {
                    Button(action: {
                               currentText = randomName()
                    }) {
                        Text("Next Words")
                            .foregroundColor(.black)
                            .font(.system(size: 11, weight: .bold))
                    }
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(8)
                    .frame(width: 100, height: 30, alignment: .leading)  //size of the frame of the button.  Leading alignment to align to the left

                    Button(action: {
                    }) {
                        Image(systemName: "heart")
                            .foregroundColor(.black)

                        Text("Like")
                            .font(.system(size: 11, weight: .bold))
                            .foregroundColor(.black)
                    }
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(8)
                    .frame(width: 100, height: 30, alignment: .leading)  //size of the frame of the button.  Leading alignment to align to the left

                }
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width * 0.65)
            .background(Color.blue.opacity(0.3))
        }
    }
}

#Preview {
    ContentView()
}
