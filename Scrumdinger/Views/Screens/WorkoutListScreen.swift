//
//  WorkoutListScreen.swift
//  Scrumdinger
//
//  Created by Joseph DeWeese on 4/23/23.
//

import SwiftUI

struct WorkoutListScreen: View {
    //MARK:  PROPERTIES
    @Binding var workouts: [DailyWorkout]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewWorkoutView = false
    let saveAction: ( )-> Void
    
    var body: some View {
        
        NavigationStack {
            List($workouts) { $workout in
                NavigationLink(destination: WorkoutDetailScreen(workout: $workout)) {
                    WorkoutCardView(workout: workout)
                }
                .listRowBackground(workout.theme.mainColor)
                
            }
            .navigationBarTitle("Daily Workout")
            .toolbar {
                Button(action: {
                    isPresentingNewWorkoutView = true
                }) {
                    Image(systemName: "plus")
                    
                }
                .accessibilityLabel("New Workout")
            }
        }
            .sheet(isPresented: $isPresentingNewWorkoutView) {
                NewWorkoutSheet(workouts: $workouts, isPresentingNewWorkoutView: $isPresentingNewWorkoutView)
            }
            .onChange(of: scenePhase) { phase in
                if phase == .inactive { saveAction() }
            }
        }
    }

    struct WorkoutListScreen_Previews: PreviewProvider {
        static var previews: some View {
            WorkoutListScreen(workouts: .constant(DailyWorkout.sampleData), saveAction: {})
        }
    }
