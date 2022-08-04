//
//  statsViews.swift
//  BetterSleep
//
//  Created by Nazeri, Daniel on 6/20/22.
//

import SwiftUI

// Display stats from stats.swift
struct statsViews: View {
    @StateObject var stats = Stats()
    
    var body: some View {
        VStack {
            Text("The last 7 days, you've slept for...")
            ForEach(stats.hours, id: \.self) {
                hours in
                HStack {
                    Image(systemName: "moon.zzz.fill")
                    Text("\(hours, specifier: "%.1f") hours")
                }
            }
        }
    }
}
