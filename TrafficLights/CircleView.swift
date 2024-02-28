//
//  CircleView.swift
//  TrafficLights
//
//  Created by Антон Пеньков on 28.02.2024.
//

import SwiftUI

struct CircleView: View {    
    var body: some View {
        Circle()
            .frame(width: 120, height: 120)
            .overlay(Circle().stroke(.white, lineWidth: 4))
    }
}

#Preview {
    CircleView()
}
