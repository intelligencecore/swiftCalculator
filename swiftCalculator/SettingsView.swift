//
//  SettingsView.swift
//  swiftUI-Bootcamp
//
//  Created by Richier on 2/7/26.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack{
        
            Text("Version")
                .font(.title)
                .bold()
    }
        .padding(30)
        
        Text("0.0.1")
            .font(.largeTitle)
            .bold()
            .padding(30)
    
        Text("ALFA")
            .font(.system(size: 80, weight: .heavy))
            .foregroundColor(.white)
            .padding(.horizontal, 30)
            .padding(.vertical, 15)
            .background(
                    RoundedRectangle(cornerRadius: 15)
                     .fill(
                        LinearGradient(
                                colors: [.red, .orange],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                                    )
                                )
                    .shadow(color: .black.opacity(0.3), radius: 10, y: 5)
                        )
                    .rotationEffect(.degrees(-15))
                    .padding(.bottom, 20)
                    .shadow(color: .orange.opacity(0.5), radius: 20, y: 10)  // Glow!
        
        List{
            
            Button("Info"){
                
            }

            
            Button{
                
            } label: {
                Label("Reset", systemImage: "exclamationmark.arrow.trianglehead.counterclockwise.rotate.90")
            }
            .foregroundStyle(.red)
        }
        .scrollContentBackground(.hidden)
        .background(.ultraThinMaterial)  // Frosted glass
        .cornerRadius(20)
        .padding()
    }
}

#Preview {
    SettingsView()
}
