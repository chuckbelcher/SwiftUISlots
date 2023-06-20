//
//  ContentView.swift
//  SwiftUI_Slots
//
//  Created by Chuck Belcher on 6/19/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var coins = 100
    @State private var slot1 = "cherry"
    @State private var slot2 = "star"
    @State private var slot3 = "apple"
    @State private var status = ""
    
    
    var body: some View {
        VStack {
            Text("SwiftUI Slots!")
                .font(.largeTitle)
            Text(status)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.red)
                .padding(.vertical, 5)

            HStack {
            Text("Coins: ")
                    .font(.title2)
                    .fontWeight(.bold)
                Text(String(coins))
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
            }
            .padding(.vertical, 50)
            HStack {
                Image(slot1)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(slot2)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(slot3)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Spacer()
            HStack {
                Spacer()
                Button {
                    if coins > 5 {
                        print("Spinning")
                        //Create array of images
                        let images = ["cherry", "star", "apple"]
                        
                        //Create random numbers for images
                        let slot1Rand = Int.random(in: 0...2)
                        let slot2Rand = Int.random(in: 0...2)
                        let slot3Rand = Int.random(in: 0...2)
                        
                        //Assign images
                        slot1 = images[slot1Rand]
                        slot2 = images[slot2Rand]
                        slot3 = images[slot3Rand]
                        
                        //Check if winner and add or remove coins
                        
                        if slot1Rand == slot2Rand && slot1Rand == slot3Rand {
                            print("winner winner chicken dinner")
                            coins += 5
                        } else {
                            print("please try again")
                            coins -= 5
                        }
                    } else {
                        coins = 0
                        status = "Game Over"
                    }
                } label: {
                    Text("Spin")
                        .fontWeight(.bold)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 18.0)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                }
                Spacer()
                Button {
                    reset()
                } label: {
                    Text("Reset")
                        .fontWeight(.bold)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 18.0)
                        .background(.red)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                }
                Spacer()
            }
            Spacer()
        }
        .padding()
    }
    
    func spin() {
        
    }
    
    func reset() {
        coins = 100
        status = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
