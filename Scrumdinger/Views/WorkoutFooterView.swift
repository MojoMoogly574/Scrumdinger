//
//  WorkoutFooterView.swift
//  Scrumdinger
//
//  Created by Joseph DeWeese on 5/8/23.
//

import SwiftUI

struct WorkoutFooterView: View {
    
    let speakers: [WorkoutTimer.Speaker]
    
    var skipAction: ()->Void
    
    private var speakerNumber: Int? {
            guard let index = speakers.firstIndex(where: { !$0.isCompleted }) else { return nil }
            return index + 1
        }
    private var isLastSpeaker: Bool {
            return speakers.dropLast().allSatisfy { $0.isCompleted }
        }
    private var speakerText: String {
            guard let speakerNumber = speakerNumber else { return "No more exercises" }
            return "Exercise \(speakerNumber) of \(speakers.count)"
        }
    
    var body: some View {
        VStack {
            HStack {
                if isLastSpeaker {
                    Text("Last Exercise")
                } else {
                    Text(speakerText)
                    Spacer()
                    Button(action: skipAction) {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel("Next Exercise")
                }
            }
        }
            .padding([.bottom, .horizontal])
        }
    }
       

struct WorkoutFooterView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutFooterView(speakers: DailyWorkout.sampleData[0].exercises.speakers, skipAction: {})
            .previewLayout(.sizeThatFits)
    }
}
