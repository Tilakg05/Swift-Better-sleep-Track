//
//  ContentView.swift
//  BetterSleep
//
//  Created by Immanuel Sotelo on 6/8/22.
//

import SwiftUI
import UIKit

struct TimerView: View {
    @StateObject var timer = SleepTimer(timeGoal: 8.0)
    @State var shortString = true
    
    
    
    var body: some View {
        
        NavigationView{
            VStack {
                
                Text(shortString ? "ZZZ." : "ZZZ......").font(.title)
                    .animation(.easeInOut(duration:2.0))
                                .padding()

               
                ZStack {
                    
                    Circle()
                        .stroke(Color.gray.opacity(0.25),lineWidth: 25)
                        .frame(width: 300, height: 300)
                    Circle()
                        .trim(from: 0, to: timer.timePercent)
                        .stroke(Color.blue,lineWidth: 25)
                        .frame(width: 300, height: 300)
                        .rotationEffect(.init(degrees: -90))
                        .animation(.default)
                        
                    Text("You have slept for \(timer.timeSlept, specifier: "%.2f") Hours")
                        .foregroundColor(.blue)
                        .font(.caption)
                        
                }.padding()
                Spacer()
                NavigationLink(destination: AwakeView()) {
                    
                    Text("Tap Here to wake up . . .").foregroundColor(.blue)
                        .padding().background(Color.blue.opacity(0.2)).cornerRadius(20)
                }
                
            }.onTapGesture {
        
                timer.startSleeping()
                let animTimer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { animTimer in
                    if(timer.timer != nil)
                    {
                        shortString = !shortString
                    }
                    else{
                        animTimer.invalidate()
                    }
                }
               
            }
            
        }.environmentObject(timer)
    }
    
        
}

struct AwakeView: View {
    @EnvironmentObject var timer : SleepTimer
    var body: some View {
        Text("Good Morning!")
            .fontWeight(.bold)
            .onAppear(perform: timer.stopSleeping)
            .padding()
            .font(.largeTitle)
        Text("Last night, you were asleep for \(timer.timeSlept, specifier: "%.2f") hours.")
            .font(.headline)
        Text("(Thats a total of \(timer.timePercent*100, specifier: "%.2f")% of your sleep goal for that night)")
            .font(.subheadline)
        
        
    }
}
struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
