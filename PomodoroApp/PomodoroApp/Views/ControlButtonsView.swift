import SwiftUI

struct ControlButtonsView: View {
    @ObservedObject var timerState: TimerState
    
    var body: some View {
        HStack(spacing: 30) {
            // Play/Pause Button
            Button(action: {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                    if timerState.isTimerRunning {
                        timerState.stopTimer()
                    } else {
                        timerState.startTimer()
                    }
                }
            }) {
                Image(systemName: timerState.isTimerRunning ? "pause.circle.fill" : "play.circle.fill")
                    .resizable()
                    .frame(width: 64, height: 64)
                    .foregroundColor(timerState.isTimerRunning ? .red : .green)
                    .symbolEffect(.bounce, value: timerState.isTimerRunning)
            }
            
            // Reset Button
            Button(action: {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                    timerState.resetTimer()
                }
            }) {
                Image(systemName: "arrow.clockwise.circle.fill")
                    .resizable()
                    .frame(width: 64, height: 64)
                    .foregroundColor(.blue)
            }
        }
        .padding(.top, 20)
    }
}

#Preview {
    ControlButtonsView(timerState: TimerState())
} 