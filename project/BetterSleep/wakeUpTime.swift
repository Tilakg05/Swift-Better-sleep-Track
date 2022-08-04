//
//  wakeUpTime.swift
//  BetterSleep
//
//  Created by Souri, Michael on 6/13/22.
//

import Foundation
import SwiftUI

class wakeUpTime: ObservableObject {
    @Published var hour: Int
    @Published var minute: Int
    //@Published var amPM: String
    
    init(hour: Int, minute: Int) {
        self.hour = hour
        self.minute = minute
        //self.amPM = amPM
    }
    
    public func printTime() {
        print("\(hour) : \(minute)")
    }
}
