//
//  WorkoutCardView.swift
//  Scrumdinger
//
//  Created by Joseph DeWeese on 4/23/23.
//

import SwiftUI

struct WorkoutCardView: View {
    //MARK:  PROPERTIES
    let workout: DailyWorkout
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(workout.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)

            Spacer()
            HStack{
                Label("\(workout.exercises.count)", systemImage: "figure.strengthtraining.traditional")
                    .accessibilityLabel("\(workout.exercises.count) exercises")

                Spacer()
                Label("\(workout.lengthInMinutes)", systemImage: "clock")
                    .accessibilityLabel("\(workout.lengthInMinutes) minute workout")
                    .labelStyle(.trailingIcon)

            }
            .font(.caption)

        }
        .padding()
        .foregroundColor(workout.theme.accentColor)

    }
}

struct WorkoutCardView_Previews: PreviewProvider {
    static var workout = DailyWorkout.sampleData[0]
        static var previews: some View {
            WorkoutCardView(workout: workout)
                .background(workout.theme.mainColor)
                .previewLayout(.fixed(width: 400, height: 60))
        }
    }
