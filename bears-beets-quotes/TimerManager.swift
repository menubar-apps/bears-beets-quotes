//
//  TimerManager.swift
//  bears-beets-quotes
//
//  Created by Pavel Makhov on 2025-03-10.
//

import Foundation
import UserNotifications

class TimerManager: ObservableObject {
    @Published var timerDuration: TimeInterval = 60
    @Published var isTimerRunning = false
    private var timer: Timer?
    var quoteClient = QuoteClient()
    
    init() {
        requestNotificationPermissions()
    }
    
    func startTimer() {
        guard !isTimerRunning else { return }
        isTimerRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: timerDuration, repeats: false) { _ in
            self.isTimerRunning = false
            self.sendNotification()
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
        isTimerRunning = false
    }
    
    func sendNotification() {
        
        quoteClient.getRandomQuote { quote in
            let content = UNMutableNotificationContent()
            content.title = quote?.character ?? ""
            content.body = quote?.quote  ?? ""
            content.sound = UNNotificationSound.default
            content.badge = 5
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
            
            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    print("Error sending notification: \(error.localizedDescription)")
                } else {
                    print("Notification sent successfully")
                }
            }
        }
    }
    
    private func requestNotificationPermissions() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("Error requesting notification authorization: \(error.localizedDescription)")
            } else if granted {
                print("Notification permissions granted")
            } else {
                print("Notification permissions denied")
            }
        }
    }
}
