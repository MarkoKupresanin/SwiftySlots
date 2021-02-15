//
//  ContentView.swift
//  SlotsGame
//
//  Created by Marko Kupresanin on 2/14/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var creditBalance = 1500
    @State var place1 = "slot1"
    @State var place2 = "slot2"
    @State var place3 = "slot3"
    
    var body: some View {
        ZStack {
            VStack {
                Text("SwiftUI Slots!")
                    .font(.largeTitle)
                    .foregroundColor(Color.black)
                    .padding(.top, 15.0)
                Spacer()
                
                Text("Credits: " + String(creditBalance))
                Spacer()
                Spacer()
                Spacer()
            }
            VStack {
                Spacer()
                HStack {
                    Image(place3)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Image(place2)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Image(place1)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                Spacer()
                HStack {
                    Button(action: {
                        
                        // Getting the images to change when button is pressed
                        let img1 = Int.random(in: 1...3)
                        let img2 = Int.random(in: 1...3)
                        let img3 = Int.random(in: 1...3)
                        
                        place1 = "slot" + String(img1)
                        place2 = "slot" + String(img2)
                        place3 = "slot" + String(img3)
                        
                        // Checking to see if the images are the same
                        
                        if place1 == place2 && place2 == place3 {
                          creditBalance += 69
                        }
                        
                        else if creditBalance <= 69 {
                            place1 = "cross-mark"
                            place2 = "cross-mark"
                            place3 = "cross-mark"
                            creditBalance += 1500
                        }
                        
                        else {
                            creditBalance -= 69
                        }
                        
                    }, label: {
                        Text("Spin")
                            .frame(width: 100.0, height: 40.0)
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.purple/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 2)
                                    .stroke(Color.purple, lineWidth: 5))
                    })
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
