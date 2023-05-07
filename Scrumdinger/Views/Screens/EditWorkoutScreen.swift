//
//  EditWorkoutScreen.swift
//  Scrumdinger
//
//  Created by Joseph DeWeese on 5/7/23.
//

import SwiftUI

struct EditWorkoutScreen: View {
    //MARK:  PROPERTIES
    @State private var workout = DailyWorkout.emptyWorkout
    @State private var newExerciseName = ""
    
    
    
    var body: some View {
        Form {
            Section(header: Text("Workout Info")) {
                TextField("Title", text: $workout.title)
                HStack {
                    Slider(value: $workout.lengthInMinutesAsDouble, in: 5...90,  step: 1) {
                        Text("Length")
                    }
                    .accessibilityValue("\(workout.lengthInMinutes) minutes")
                    Spacer()
                    Text("\(workout.lengthInMinutes) minutes")
                        .accessibilityHidden(true)
                }
            }
            
            Section(header:  Text("Exercises")) {
                ForEach(workout.exercises) { exercise in
                    Text(exercise.name)
                }
                .onDelete { indices in
                    workout.exercises.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Exercise", text: $newExerciseName)
                    Button(action: {
                                            withAnimation {
                                                let exercise = DailyWorkout.Exercise(name: newExerciseName)
                                                workout.exercises.append(exercise)
                                                newExerciseName = ""
                                            }
                                        }) {
                                            Image(systemName: "plus.circle.fill")
                                        }
                                        .disabled(newExerciseName.isEmpty)
                                    }
                                }
                            }
                        }
                    }
             
struct EditWorkoutScreen_Previews: PreviewProvider {
    static var previews: some View {
        EditWorkoutScreen()
    }
}
