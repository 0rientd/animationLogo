//
//  FinalView.swift
//  animationLogo
//
//  Created by 0rientd on 29/06/21.
//

import SwiftUI

struct FinalView : View {
    
    @State private var percentLoadedToFinish = 0.000
    @State private var percentLoadedToStart = 0.000
    @State private var opacityLogo = 0.0
    @State private var shadowLogo = CGFloat(0)
    @State private var degrees : Double = 0.0
    @State private var lineWidth = 8.0
    @State private var initialColor = [Color.pink, Color.purple]
    
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            
            VStack {
                Circle()
                    .trim(from: CGFloat(self.percentLoadedToStart), to: CGFloat(self.percentLoadedToFinish))
                    .stroke(lineWidth: CGFloat(self.lineWidth))
                    .fill(
                        LinearGradient(gradient: Gradient(colors: self.initialColor), startPoint: .leading, endPoint: .trailing)
                    )
                    .scaledToFit()
                    .padding()
                    .rotationEffect(.degrees(self.degrees))
                    .overlay(
                        Text("dev.0rientd")
                            .bold()
                            .opacity(self.opacityLogo)
                            .shadow(radius: self.shadowLogo)
                            .font(.system(size: 45))
                            .foregroundColor(.white)
                    )
                    .onAppear() {
                        withAnimation(.easeIn(duration: 4.5)) {
                            for _ in 0...10 {
                                self.percentLoadedToFinish += 0.1
                            }
                        }
                        
                        withAnimation(.easeIn(duration: 3.0)) {
                            self.opacityLogo = 1.0
                            self.shadowLogo = CGFloat(5)
                        }
                        
                        withAnimation(.easeInOut(duration: 4.3)) {
                            self.degrees = 765.0
                        }
                }
            }
        }
    }
}
