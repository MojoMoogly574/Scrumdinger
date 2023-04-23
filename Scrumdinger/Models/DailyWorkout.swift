//
//  DailyWorkout.swift
//  Scrumdinger
//
//  Created by Joseph DeWeese on 4/23/23.
//

import Foundation


struct DailyWorkout {
   
        var title: String
        var exercises: [String]
        var lengthInMinutes: Int
        var theme: Theme
    }

//MARK:  SAMPLE DATA
extension DailyWorkout {
    static let sampleData: [DailyWorkout] =
    [
        DailyWorkout(title: "Chest/Triceps/Combat Run",
                     exercises: ["Flat Bench Press 15-12-10-8-6-4", "Incline Dumbbell Press 3x10-12", "Pec-Deck 3x10-12", "Tricep Pushdowns 5x10-12", "Tricep Extensions 3x10-12", "15 minute run, 2 mins slow pace, 1 min fast pace", "Stretch"],
                   lengthInMinutes: 60,
                   theme: .yellow),
        DailyWorkout(title: "Back/Biceps/Combat Run",
                     exercises: ["Flat Bench Press 15-12-10-8-6-4", "Incline Dumbbell Press 3x10-12", "Pec-Deck 3x10-12", "Tricep Pushdowns 5x10-12", "Tricep Extensions 3x10-12", "15 minute run, 2 mins slow pace, 1 min fast pace", "Stretch"],
                   lengthInMinutes: 60,
                   theme: .orange),
        DailyWorkout(title: "Legs/Abs/Combat Run",
                     exercises: ["Flat Bench Press 15-12-10-8-6-4", "Incline Dumbbell Press 3x10-12", "Pec-Deck 3x10-12", "Tricep Pushdowns 5x10-12", "Tricep Extensions 3x10-12", "15 minute run, 2 mins slow pace, 1 min fast pace", "Stretch"],
                   lengthInMinutes: 60,
                   theme: .poppy),
        DailyWorkout(title: "Shoulders/Traps/Combat Run",
                     exercises: ["Flat Bench Press 15-12-10-8-6-4", "Incline Dumbbell Press 3x10-12", "Pec-Deck 3x10-12", "Tricep Pushdowns 5x10-12", "Tricep Extensions 3x10-12", "15 minute run, 2 mins slow pace, 1 min fast pace", "Stretch"],
                   lengthInMinutes: 60,
                   theme: .poppy)
    ]
}
