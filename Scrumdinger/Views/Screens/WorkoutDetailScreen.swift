//
//  WorkoutDetailScreen.swift
//  Scrumdinger
//
//  Created by Joseph DeWeese on 5/7/23.
//

import SwiftUI

struct WorkoutDetailScreen: View {
    //Mark:  PROPERTIES
    @Binding var workout:  DailyWorkout
    @State private var isPresentingEditWorkoutScreen = false
    @State private var editingWorkout = DailyWorkout.emptyWorkout
    
    var body: some View {
        List {
            Section(header: Text("Workout Info")) {
                NavigationLink(destination: WorkoutView(workout: $workout)) {
                    
                    Label("Start Workout", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(workout.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(workout.theme.name)
                        .padding(4)
                        .foregroundColor(workout.theme.accentColor)
                        .background(workout.theme.mainColor)
                        .cornerRadius(10)
                }
                .accessibilityElement(children: .combine)
                
            }
            Section(header:  Text("Exercises")) {
                ForEach(workout.exercises) { exercise in
                    Label(exercise.name, systemImage: "figure.strengthtraining.traditional")
                }
                
            }
            Section(header: Text("Workout History")) {
                if workout.history.isEmpty {
                    Label("No Recorded Workouts", systemImage: "calendar.badge.exclamationmark")
                }
                ForEach(workout.history)    { history in
                    HStack {
                                            Image(systemName: "calendar")
                                            Text(history.date, style: .date)
                                        }
                }
            }
        }
        .navigationTitle(workout.title)
        .toolbar {
            Button("Edit") {
                isPresentingEditWorkoutScreen  = true
                editingWorkout = workout
            }
        }
        .sheet(isPresented: $isPresentingEditWorkoutScreen) {
            NavigationStack {
                EditWorkoutScreen(workout: $editingWorkout)
                    .navigationTitle(workout.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditWorkoutScreen = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditWorkoutScreen = false
                                workout = editingWorkout
                            }
                        }
                    }
            }
        }
    }
}
struct WorkoutDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            WorkoutDetailScreen(workout: .constant(DailyWorkout.sampleData[0]))
        }
    }
}
