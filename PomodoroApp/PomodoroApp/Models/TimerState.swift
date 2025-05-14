import Foundation
import SwiftUI

enum TimerMode {
    case focus
    case shortBreak
    case longBreak
}

class TimerState: ObservableObject {
    @Published var timeRemaining: Int
    @Published var isTimerRunning = false
    @Published var mode: TimerMode = .focus
    @Published var completedPomodoros = 0
    @Published var isDarkMode = false
    
    // Timer settings
    let focusTime: Int = 25 * 60 // 25 minutes
    let shortBreakTime: Int = 5 * 60 // 5 minutes
    let longBreakTime: Int = 15 * 60 // 15 minutes
    let pomodorosUntilLongBreak = 4
    
    var timer: Timer?
    
    init() {
        self.timeRemaining = focusTime
    }
    
    func startTimer() {
        isTimerRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                self.timerCompleted()
            }
        }
    }
    
    func stopTimer() {
        isTimerRunning = false
        timer?.invalidate()
        timer = nil
    }
    
    func resetTimer() {
        stopTimer()
        setTimeForCurrentMode()
    }
    
    func switchMode(_ newMode: TimerMode) {
        mode = newMode
        stopTimer()
        setTimeForCurrentMode()
    }
    
    private func setTimeForCurrentMode() {
        switch mode {
        case .focus:
            timeRemaining = focusTime
        case .shortBreak:
            timeRemaining = shortBreakTime
        case .longBreak:
            timeRemaining = longBreakTime
        }
    }
    
    private func timerCompleted() {
        stopTimer()
        
        // Play haptic feedback
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        
        switch mode {
        case .focus:
            completedPomodoros += 1
            if completedPomodoros % pomodorosUntilLongBreak == 0 {
                switchMode(.longBreak)
            } else {
                switchMode(.shortBreak)
            }
        case .shortBreak, .longBreak:
            switchMode(.focus)
        }
    }
    
    func timeString(from seconds: Int) -> String {
        let minutes = seconds / 60
        let remainingSeconds = seconds % 60
        return String(format: "%02d:%02d", minutes, remainingSeconds)
    }
} 