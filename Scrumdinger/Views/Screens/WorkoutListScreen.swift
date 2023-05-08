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
                    
                }) {
                   Text("Add Workout")
                       
                }
                .accessibilityLabel("New Workout")
            }
          
        }
        
        }
       
    }

