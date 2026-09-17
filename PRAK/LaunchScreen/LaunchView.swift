//
//  LaunchView.swift
//  Bobbyn
//
//  Created by Brainmobi on 30/07/26.
//

import SwiftUI

 struct LaunchView: View {
    @State private var markVisible = false
    @State private var wordVisible = false
    @State private var lineScale: CGFloat = 0
    var body: some View {
        ZStack {
            Color.bobbynInk.ignoresSafeArea()
            VStack(spacing: 23) {
                ZStack {
                    RoundedRectangle(cornerRadius: 4).stroke(Color.bobbynCream, lineWidth: 1.5).frame(width: 48, height: 48)
                    Text("P").font(.system(size: 30, weight: .medium, design: .serif))
                }
                .foregroundStyle(Color.bobbynCream).scaleEffect(markVisible ? 1 : 0.62).opacity(markVisible ? 1 : 0)
                VStack(spacing: 0) {
                    Text("PRAK").font(.system(size: 26, weight: .medium, design: .serif)).tracking(7)
                }
                .foregroundStyle(Color.bobbynCream).opacity(wordVisible ? 1 : 0)
                Rectangle().fill(Color.bobbynRust).frame(width: 92, height: 2).scaleEffect(x: lineScale)
            }
        }
        .onAppear {
            withAnimation(.spring(response: 0.7, dampingFraction: 0.76)) { markVisible = true }
            withAnimation(.easeOut(duration: 0.45).delay(0.35)) { wordVisible = true }
            withAnimation(.easeInOut(duration: 0.65).delay(0.55)) { lineScale = 1 }
        }
    }
}
#Preview {
    LaunchView()
}
