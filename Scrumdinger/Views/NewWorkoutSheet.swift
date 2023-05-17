//
//  NewWorkoutSheet.swift
//  Scrumdinger
//
//  Created by Joseph DeWeese on 5/16/23.
//

import SwiftUI

struct NewWorkoutSheet: View {
    @State private var newWorkout = DailyWorkout.emptyWorkout
    @Binding var workouts: [DailyWorkout]
    @Binding var isPresentingNewWorkoutView: Bool

    var body: some View {
        NavigationStack {
            WorkoutDetailScreen(workout: $newWorkout)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewWorkoutView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            workouts.append(newWorkout)
                            isPresentingNewWorkoutView = false
                        }
                    }
                }
        }
    }
}

struct NewWorkoutSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewWorkoutSheet(workouts: .constant(DailyWorkout.sampleData),
                      isPresentingNewWorkoutView: .constant(true))
    }
}
