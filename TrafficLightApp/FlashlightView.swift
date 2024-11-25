//
//  FlashlightView.swift
//  TrafficLightApp
//
//  Created by Evgeniy Maksimov on 25.11.2024.
//

import SwiftUI

struct FlashlightView: View {
    let color: Color
    var light: Double = 0.5
    
    var body: some View {
        Circle()
            .frame(width: 120, height: 120)
            .foregroundStyle(color)
            .opacity(light)
            .overlay(Circle().stroke(Color.black, lineWidth: 7))
    }
}

#Preview {
    FlashlightView(color: .red)
}

