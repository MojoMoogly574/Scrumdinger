//
//  History.swift
//  Scrumdinger
//
//  Created by Joseph DeWeese on 5/20/23.
//

import SwiftUI

struct HistoryView: View {
    let history: History

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Divider()
                    .padding(.bottom)
                Text("Exercises")
                    .font(.headline)
                Text(history.attendeeString)
                if let transcript = history.transcript {
                    Text("Transcript")
                        .font(.headline)
                        .padding(.top)
                    Text(transcript)
                }
            }
        }
        .navigationTitle(Text(history.date, style: .date))
        .padding()
    }
}

extension History {
    var attendeeString: String {
        ListFormatter.localizedString(byJoining: exercises.map { $0.name })
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var history: History {
        History(exercises: [
            DailyWorkout.Exercise(name: "Flat Bench Press 15-12-10-8-6-4"),
            DailyWorkout.Exercise(name: "Incline Dumbbell Press 3x10-12"),
            DailyWorkout.Exercise(name: "Pec-Deck 3x10-12"),
            DailyWorkout.Exercise(name: "Tricep Pushdowns 5x10-12"),
            DailyWorkout.Exercise(name: "15 minute run, 2 mins slow pace, 1 min fast pace")
        ],
                transcript: "I need to re-evaluate the volume of my workout as I am not able to complete in the time allotted for the objective.     feeling very low in energy.   ah man, bunch of hot chgicks in this place.   FUCK I SUCK")
    }
    
    static var previews: some View {
        HistoryView(history: history)
    }
}

