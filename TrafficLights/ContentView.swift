//
//  ContentView.swift
//  TrafficLights
//
//  Created by Антон Пеньков on 28.02.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var buttonText = "START"
    
    @State private var redOpacity = 0.3 {
        didSet {
            if buttonText == "START" {
                buttonText = "NEXT"
            }
        }
    }
    @State private var yellowOpacity = 0.3
    @State private var greenOpacity = 0.3
    
    @State private var currentLight = CurrentLight.red
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                VStack(spacing: 16) {
                    CircleView()
                        .foregroundColor(.red.opacity(redOpacity))
                    CircleView()
                        .foregroundColor(.yellow.opacity(yellowOpacity))
                    CircleView()
                        .foregroundColor(.green.opacity(greenOpacity))
                }
                .padding()
                
                Spacer()
                
                Button(action: buttonAction) {
                    Text(buttonText)
                        .font(.largeTitle)
                        .shadow(color: .white, radius: 5)
                        .padding()
                }
                .frame(width: 150, height: 70)
                .background(.tint)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white, lineWidth: 4)
                )
            }
            .padding()
        }
    }
    
    private func buttonAction() {
        switch currentLight {
        case .red:
            redOpacity = 1.0
            greenOpacity = 0.3
            currentLight = .yellow
        case .yellow:
            yellowOpacity = 1.0
            redOpacity = 0.3
            currentLight = .green
        case .green:
            greenOpacity = 1.0
            yellowOpacity = 0.3
            currentLight = .red
        }
    }
}

enum CurrentLight {
    case red, yellow, green
}

#Preview {
    ContentView()
}
