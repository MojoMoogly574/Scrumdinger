//
//  WorkoutDetailScreen.swift
//  Scrumdinger
//
//  Created by Joseph DeWeese on 5/7/23.
//

import SwiftUI

struct WorkoutDetailScreen: View {
    //Mark:  PROPERTIES
    let workout:  DailyWorkout
    
    
    var body: some View {
        List {
            NavigationLink(destination: WorkoutTimerScreen()) {
                Section(header: Text("Workout Info")) {
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
                                                       .cornerRadius(4)
                                               }
                                               .accessibilityElement(children: .combine)
                }
            }
            Section(header:  Text("Exercises")) {
                ForEach(workout.exercises) { exercise in
                                    Label(exercise.name, systemImage: "figure.strengthtraining.traditional")
                                }
               
                            }
         
                        }
                    }
                

struct WorkoutDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            WorkoutDetailScreen(workout: DailyWorkout.sampleData[0])
        }
    }
}
