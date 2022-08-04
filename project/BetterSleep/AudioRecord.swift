//
//  AudioRecord.swift
//  BetterSleep
//
//  Created by csuftitan on 6/29/22.
//
import Foundation
class AudioRecordManager: ObservableObject {
  @Published var audiorecords: [AudioRecord] = []
    
  init() {
     // Add initial audio record  for testing
      audiorecords.append(AudioRecord(name: "Track sleep",description: "Audio Record"))
  }
}

struct AudioRecord: Identifiable {
   
   var id = UUID()
  var name: String
 var description: String
}


