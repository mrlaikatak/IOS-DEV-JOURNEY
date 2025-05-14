//
//  ContentView.swift
//  PomodoroApp
//
//  Created by Yunus ACAR on 13.05.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timerState = TimerState()
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                colors: [
                    colorScheme == .dark ? Color.black : Color.white,
                    colorScheme == .dark ? Color(red: 0.1, green: 0.1, blue: 0.2) : Color(red: 0.95, green: 0.95, blue: 1)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            // Content
            VStack(spacing: 30) {
                // Mode selector
                ModeSelectorView(timerState: timerState)
                    .padding(.top, 20)
                
                Spacer()
                
                // Timer display
                TimerDisplayView(timerState: timerState)
                
                // Control buttons
                ControlButtonsView(timerState: timerState)
                
                // Stats
                if timerState.completedPomodoros > 0 {
                    Text("Completed: \(timerState.completedPomodoros) pomodoros")
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(.secondary)
                        .padding(.top, 20)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
