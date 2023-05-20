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
    @StateObject private var store = WorkoutStore( )
    @State private var errorWrapper: ErrorWrapper?
    
    
    var body: some Scene {
        WindowGroup {
            WorkoutListScreen(workouts: $store.workouts) {
                Task {
                    do {
                                           try await store.save(workouts: store.workouts)
                                       } catch {
                                           errorWrapper = ErrorWrapper(error: error,
                                                                       guidance: "Try again later.")
                                       }
                                   }
                               }
                               .task {
                                   do {
                                       try await store.load()
                                   } catch {
                                       errorWrapper = ErrorWrapper(error: error,
                                                                   guidance: "Daily Workout App will load sample data and continue.")
                                   }
                               }
                               .sheet(item: $errorWrapper) {
                                   store.workouts = DailyWorkout.sampleData
                                          } content: { wrapper in
                                              ErrorView(errorWrapper: wrapper)
                                          }
                                      }
                                  }
                              }
