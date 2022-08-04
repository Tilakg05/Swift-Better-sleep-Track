//
import Foundation
import SwiftUI
struct AudioRecordInfo: View {
   @EnvironmentObject var manager: AudioRecordManager
    @State var AVAudioRecorder: String = " "
    var body: some View {
        NavigationView {
            VStack {
                HStack{
                Text("Sleep Audio Record")
                    .bold()
                    .font(.largeTitle)
                }
               List {
                    Section(header: Text("RecordSleep History")) {
                        NavigationLink(destination: Text("you are good sleep")) {
                           Text("Slepping Record")                        }
                       }
                   // give the histroy of the record
                   HStack {
                       NavigationLink(destination: Text("you are snowring 10%, couffing 5%")){
                       Text("Sleeping Noise record")
                           .bold()
                           Spacer()
                       }
                       }
                      }
                    }
                }
                Spacer()
            }
        }

struct RecordView: View {
    @SceneStorage("AudioRecordName") var AudioRecordName: String = ""
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                Text("Noise History")
                    .bold()
                    .font(.largeTitle)
                }
                .padding(.bottom, 30)

                HStack {
                    Text("Coffing 20%")
                        .bold()
                    Spacer()
                }
                HStack {
                    Text("Walking sound....10%....")
                        .bold()
                    Spacer()
                }
                HStack {
                    Text("Snoring.......5%...")
                        .bold()
                    Spacer()
                }
                Button(action:{
                            }) {
                                // Create a record button
                                    VStack{
                                        Circle()
                                            .fill(Color.red)
                                            .overlay(Circle()
                                            .stroke(lineWidth: 5)
                                            .foregroundColor(.black))
                                            .frame(width: 200, height: 200)
                                        
                                    }
                                    .padding(.bottom, 5)
                                HStack{
                                 Text("Record ")
                     //           .modifier(ButtonDesign())
                                }
                               }
                            }
                            .padding(.vertical,10)
                        }
                        .navigationBarTitle("Audio sleep Record")
                    }
            }
class AddRecordHistoryList: ObservableObject {
    @Published var searchStrings: [String] = []
    var maxRecord: Int = 5
    var fileURL: URL
    
    init() {
        
        let documentsDirectory =
           FileManager.default.urls(for: .documentDirectory,
                                     in: .userDomainMask).first!
        
        
        fileURL =
            documentsDirectory.appendingPathComponent("Audiorecord")
                .appendingPathExtension("plist")
                AudioHistory()
        }
    func AudioHistory() {
       
        let propertyListDecoder = PropertyListDecoder()
                if let retrievedURL = try? Data(contentsOf: fileURL),
                    let decodedURL = try?
                    propertyListDecoder.decode(Array<String>.self,
                   from: retrievedURL) {
                    searchStrings = decodedURL
                }
            }
         }

