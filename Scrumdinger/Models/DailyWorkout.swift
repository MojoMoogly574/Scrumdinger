//
//  DailyWorkout.swift
//  Scrumdinger
//
//  Created by Joseph DeWeese on 4/23/23.
//

import Foundation


struct DailyWorkout: Identifiable {
        let id: UUID
        var title: String
        var exercises: [Exercise]
        var lengthInMinutes: Int
        var theme: Theme
    
    init(id: UUID = UUID(), title: String, exercises: [String], lengthInMinutes: Int, theme: Theme) {
            self.id = id
            self.title = title
            self.exercises = exercises.map  { Exercise(name: $0) }
            self.lengthInMinutes = lengthInMinutes
            self.theme = theme
        }
    }
extension DailyWorkout {
    struct Exercise: Identifiable {
        let id: UUID
                var name: String
                
                init(id: UUID = UUID(), name: String) {
                    self.id = id
                    self.name = name
                }
            }
        }
//MARK:  SAMPLE DATA
extension DailyWorkout {
    static let sampleData: [DailyWorkout] =
    [
        DailyWorkout(title: "Chest/Triceps/Combat Run/Stretch",
                     exercises: ["Flat Bench Press 15-12-10-8-6-4", "Incline Dumbbell Press 3x10-12", "Pec-Deck 3x10-12", "Tricep Pushdowns 5x10-12", "Tricep Extensions 3x10-12", "15 minute run, 2 mins slow pace, 1 min fast pace", "Stretch"],
                   lengthInMinutes: 60,
                     theme: .lavender),
        DailyWorkout(title: "Back/Biceps/Combat Run/Stretch",
                     exercises: ["Pull-ups, 12-10-8-6-8-10-12", "Bent Over Lat Rows, 3x10-12", "Dumbbell Curls, 8x8-10", "Preacher Curls, 3x10-12", "Alternate Forearm Curls, 3x10-12", "15 minute run, 2 mins slow pace, 1 min fast pace", "Stretch"],
                   lengthInMinutes: 60,
                   theme: .orange),
        DailyWorkout(title: "Legs/Abs/Combat Run/Stretch",
                     exercises: ["Squats, 5x10-12", "Leg Extensions, 4x10-12", "Leg Curls, 3x10-12", "Crunches, 100 reps", "Planks 6x30 seconds", "15 minute run, 2 mins slow pace, 1 min fast pace", "Stretch"],
                   lengthInMinutes: 60,
                   theme: .poppy),
        DailyWorkout(title: "Shoulders/Traps/Combat Run/Stretch",
                     exercises: ["Flat Bench Press 15-12-10-8-6-4", "Incline Dumbbell Press 3x10-12", "Pec-Deck 3x10-12", "Tricep Pushdowns 5x10-12", "Tricep Extensions 3x10-12", "15 minute run, 2 mins slow pace, 1 min fast pace", "Stretch"],
                   lengthInMinutes: 60,
                   theme: .navy)
    ]
}
