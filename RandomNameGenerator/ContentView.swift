//
//  ContentView.swift
//  RandomNameGenerator
//
//  Created by Paul Naranja on 8/22/25.
//

import SwiftUI

struct ContentView: View {
    @State private var currentText = "Paul"
    @State private var buttonIndex = 0

    private let names = ["Adam", "Bob", "Jennifer", "Mae", "Paul"]

    func randomName() -> String! {
        let temp = names.randomElement()
        return if temp == currentText { randomName() } else { temp }
    }

    var body: some View {
        HStack(spacing: 0) {
            VStack(spacing: 10 /*spacing between each major element in the Vstack*/) {
                Button(action: {
                    buttonIndex = 0
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
                .background(buttonIndex == 0 ? Color.gray : Color.white)
                .cornerRadius(8)
                .frame(width: 120, height: 40, alignment: .leading)  //size of the frame of the button.  Leading alignment to align to the left

                Button(action: {
                    buttonIndex = 1
                }) {
                    HStack {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.black)
                        Text("Favorites")
                            .foregroundColor(.black)
                            .font(.system(size: 14))
                    }
                }
                .buttonStyle(.bordered)
                .background(buttonIndex == 1 ? Color.gray : Color.white)
                .cornerRadius(8)
                .frame(width: 120, height: 40, alignment: .leading)  //size of the frame of the button.  Leading alignment to align to the left

                Spacer() // Empty space all the way down from the last element
            }
            .frame(width: UIScreen.main.bounds.width * 0.35) // Take 35% of total width of screen
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
            .frame(width: UIScreen.main.bounds.width * 0.65) // Take 65% of total width of screen
            .background(Color.blue.opacity(0.3))
        }
    }
}

#Preview {
    ContentView()
}
