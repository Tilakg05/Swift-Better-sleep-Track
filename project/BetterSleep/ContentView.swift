//
//  ContentView.swift
//  BetterSleep
//
//  Created by Nazeri, Daniel on 6/8/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            wakeUpTimeView()
                .tabItem {
                    Image(systemName: "alarm.fill")
                    Text("Set Wake Up Time")
                }
            TimerView()
                .tabItem{
                    Image(systemName:"timer")
                    Text("Sleep Timer")
                }
            statsViews()
                .tabItem{
                    Image(systemName: "chart.bar.fill")
                    Text("Statistics")
                }
          
                AudioRecordInfo()
                    .tabItem {
                        Image(systemName: "info")
                        Text("Sleep info")
                    }
            RecordView()
                .tabItem{
                    Image(systemName:"info")
                    Text("Record history")
                }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
  }
