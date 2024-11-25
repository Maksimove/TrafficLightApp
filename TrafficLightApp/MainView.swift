//
//  ContentView.swift
//  TrafficLightApp
//
//  Created by Evgeniy Maksimov on 25.11.2024.
//

import SwiftUI

enum FlashlightColor {
    case red, yellow, green
}

struct MainView: View {
    @State private var trafficColor: FlashlightColor = .red
    @State private var startTrafficlight = "START"
    
    @State private var flashlightRed = FlashlightView(color: .red)
    @State private var flashlightYellow = FlashlightView(color: .yellow)
    @State private var flashlightGreen = FlashlightView(color: .green)
    
    @State private var trafficLightOn = 1.0
    @State private var trafficLightOff = 0.5
    
    var body: some View {
        VStack{
            VStack {
                flashlightRed
                    .padding(.bottom, 15)
                flashlightYellow
                    .padding(.bottom, 15)
                flashlightGreen
                    .padding(.bottom, 15)
            }
            Spacer()
            Button {
                switchFlashlightColor()
            } label: {
                Text("\(startTrafficlight)")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
            }
            .frame(width: 200, height: 70)
            .background(Rectangle().clipShape(.capsule))
            .foregroundStyle(.blue)
            .overlay(Capsule().stroke(Color.black, lineWidth:  5))
        }
        Spacer()
    }
    
    private func switchFlashlightColor() {
        startTrafficlight = "NEXT"
        
        switch trafficColor {
        case .red:
            flashlightGreen.light = trafficLightOff
            flashlightRed.light = trafficLightOn
            trafficColor = .yellow
        case .yellow:
            flashlightRed.light = trafficLightOff
            flashlightYellow.light = trafficLightOn
            trafficColor = .green
        case .green:
            flashlightYellow.light = trafficLightOff
            flashlightGreen.light = trafficLightOn
            trafficColor = .red
        }
    }
}

#Preview {
    MainView()
}
