//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Joseph DeWeese on 4/22/23.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var workouts = DailyWorkout.sampleData
    
    var body: some Scene {
        WindowGroup {
            WorkoutListScreen(workouts: $workouts)
        }
    }
}
