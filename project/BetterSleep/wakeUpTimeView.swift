//
//  wakeUpTimeView.swift
//  BetterSleep
//
//  Created by Souri, Michael on 6/20/22.
//

import SwiftUI

struct wakeUpTimeView: View {
    @StateObject var timeCalc = wakeUpTime(hour: 10, minute: 30)
    @State var currentTime = Date()
    var closedRange = Calendar.current.date(byAdding: .year, value: -1, to: Date())!
    
    func formatTime() -> String {
        let components = Calendar.current.dateComponents([.hour, .minute], from: currentTime)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        
        return "\(hour):\(minute)"
    }

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header:Text("Pick a sleep time")) {
                        DatePicker(" ➤➤➤➤➤   ", selection: $currentTime)
                        Text("\(formatTime())")
                    }
                    NavigationLink(destination: viewTime(), label: {
                        calcButtonView().onTapGesture {
                            let components = Calendar.current.dateComponents([.hour, .minute], from: currentTime)
                            var hour = (components.hour ?? 0) + 8
                            
                            if (hour > 23) {
                                hour = 0
                            }
                            
                            let minute = components.minute ?? 0
                            timeCalc.hour = hour
                            timeCalc.minute = minute
                        }
                    })
                } .navigationTitle("I plan to wake up at...")
            }
        } .environmentObject(timeCalc)
    }
}

struct viewTime: View {
    @EnvironmentObject var optimalTime: wakeUpTime
    var body: some View {
        Text("You should try to wake up at...")
            .fontWeight(.bold)
            .padding()
            .font(.title2)
        Text("\(optimalTime.hour):\(optimalTime.minute)")
            .fontWeight(.bold)
            .padding()
            .font(.largeTitle)
    }
}

struct calcButtonView: View {
    var body: some View {
        Text("Calculate")
            .bold()
            .frame(width: 275, height: 50)
            .background(Color.red)
            .foregroundColor(Color.white)
            .cornerRadius(10)
    }
}

struct wakeUpTimeView_Previews: PreviewProvider {
    static var previews: some View {
        wakeUpTimeView()
    }
}
