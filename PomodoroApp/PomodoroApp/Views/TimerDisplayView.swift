import SwiftUI

struct TimerDisplayView: View {
    @ObservedObject var timerState: TimerState
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            // Background blur effect
            Circle()
                .fill(.ultraThinMaterial)
                .frame(width: 280, height: 280)
                .shadow(color: .black.opacity(0.1), radius: 20, x: 0, y: 10)
            
            // Timer display
            VStack(spacing: 8) {
                Text(timerState.timeString(from: timerState.timeRemaining))
                    .font(.system(size: 70, weight: .bold, design: .rounded))
                    .foregroundColor(.primary)
                    .contentTransition(.numericText())
                    .animation(.easeInOut, value: timerState.timeRemaining)
                
                Text(modeTitle)
                    .font(.title3)
                    .foregroundColor(.secondary)
                    .padding(.top, 4)
            }
        }
        .frame(width: 300, height: 300)
    }
    
    private var modeTitle: String {
        switch timerState.mode {
        case .focus:
            return "Focus Time"
        case .shortBreak:
            return "Short Break"
        case .longBreak:
            return "Long Break"
        }
    }
}

#Preview {
    TimerDisplayView(timerState: TimerState())
        .preferredColorScheme(.dark)
} 