//
//  WorkoutStore.swift
//  Scrumdinger
//
//  Created by Joseph DeWeese on 5/19/23.
//

import Foundation
import SwiftUI



@MainActor
class WorkoutStore:  ObservableObject {
    @Published var workouts: [DailyWorkout] = []
    
    private static func fileURL( ) throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in:  .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("workouts.data")
    }
    
    
    func load( ) async throws {
        let task = Task<[DailyWorkout],  Error> {
            let fileURL = try Self.fileURL( )
            guard let data = try? Data(contentsOf:  fileURL) else {
                return[ ]
            }
            let dailyWorkouts = try JSONDecoder().decode([DailyWorkout].self, from: data )
            return dailyWorkouts
        }
        let workouts = try await  task.value
        self.workouts = workouts
        
    }
    func save(workouts: [DailyWorkout]) async throws {
        let task = Task {
            let data = try JSONEncoder( ).encode(workouts)
            let outfile = try Self.fileURL( )
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
}
