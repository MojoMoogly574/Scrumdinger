//
//  WorkoutTimerView.swift
//  Scrumdinger
//
//  Created by Joseph DeWeese on 5/20/23.
//

import SwiftUI

struct WorkoutTimerView: View {
    let speakers: [WorkoutTimer.Speaker]
    let isRecording: Bool
    let theme: Theme
    
    private var currentSpeaker: String {
        speakers.first(where: { !$0.isCompleted })?.name ?? "Exercise"
    }
    
    var body: some View {
        Circle()
            .strokeBorder(lineWidth: 24)
            .overlay {
                VStack {
                    Text(currentSpeaker)
                        .font(.title)
                    Text("current exercise")
                    Image(systemName: isRecording ? "mic" : "mic.slash")
                        .font(.title)
                        .padding(.top)
                        .accessibilityLabel(isRecording ? "with transcription" : "without transcription")
                }
                .accessibilityElement(children: .combine)
                .foregroundStyle(theme.accentColor)
            }
            .overlay  {
                            
                ForEach(speakers) { speaker in
                                   if speaker.isCompleted, let index = speakers.firstIndex(where: { $0.id == speaker.id }) {
                                       SpeakerArc(speakerIndex: index, totalSpeakers: speakers.count)
                                           .rotation(Angle(degrees: -90))
                                            .stroke(theme.mainColor, lineWidth: 12)
                                   }
                               }
                           }
                           .padding(.horizontal)
                   }
               }

struct WorkoutTimerView_Previews: PreviewProvider {
    static var speakers: [WorkoutTimer.Speaker] {
           [WorkoutTimer.Speaker(name: "Bill", isCompleted: true), WorkoutTimer.Speaker(name: "Cathy", isCompleted: false)]
       }
    static var previews: some View {
        WorkoutTimerView(speakers: speakers,isRecording: true, theme: .yellow)
    }
}
