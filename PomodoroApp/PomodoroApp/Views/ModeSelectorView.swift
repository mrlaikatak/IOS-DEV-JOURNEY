import SwiftUI

struct ModeSelectorView: View {
    @ObservedObject var timerState: TimerState
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach([TimerMode.focus, .shortBreak, .longBreak], id: \.self) { mode in
                Button(action: {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                        timerState.switchMode(mode)
                    }
                }) {
                    Text(modeTitle(for: mode))
                        .font(.system(.body, design: .rounded))
                        .fontWeight(.medium)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .frame(maxWidth: .infinity)
                        .background(
                            timerState.mode == mode ?
                            Color.accentColor.opacity(0.2) :
                            Color.clear
                        )
                        .foregroundColor(timerState.mode == mode ? .accentColor : .secondary)
                }
            }
        }
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.secondary.opacity(0.2), lineWidth: 1)
        )
        .padding(.horizontal)
    }
    
    private func modeTitle(for mode: TimerMode) -> String {
        switch mode {
        case .focus:
            return "Focus"
        case .shortBreak:
            return "Short Break"
        case .longBreak:
            return "Long Break"
        }
    }
}

#Preview {
    ModeSelectorView(timerState: TimerState())
        .padding()
} 