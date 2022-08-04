//
//  stats.swift
//  BetterSleep
//
//  Created by Nazeri, Daniel on 6/20/22.
//

import Foundation

// Hard-coded number of hours slept for 7 days
//@ObservableObject var stats = [4.7, 7.5, 6.5, 5.4, 6.3, 8.1, 5.9]

class Stats: ObservableObject, Identifiable{
    // Properties
    @Published var hours = [4.7, 7.5, 6.5, 5.4, 6.3, 8.1, 5.9]
    
    func returnCont() -> Int{
        return hours.count
    }
}
