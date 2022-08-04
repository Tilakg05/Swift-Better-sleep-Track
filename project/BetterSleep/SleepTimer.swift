//
//  SleepTimer.swift
//  BetterSleep
//
//  Created by csuftitan on 6/8/22.
//

import Foundation

class SleepTimer: ObservableObject
{
    
    @Published var timeSlept : Double
    @Published var timeGoal : Double
    @Published var timePercent : Double
    @Published var timer: Timer?
    init(timeGoal : Double)
    {
        self.timeGoal = timeGoal
        self.timeSlept = 0.1
        self.timePercent = 0.0
       

    }
    func startSleeping() {
       guard timer == nil else { return }
       timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
   }

   func stopSleeping() {
       guard timer != nil else { return }
       timer?.invalidate()
       timer = nil
   }

   @objc func timerAction() {
       self.timeSlept += 0.1
       self.timePercent = self.timeSlept/self.timeGoal

   }
    
    func stopSleeping(at timeSlept : Double){
        self.timeSlept = timeSlept
    }
}
