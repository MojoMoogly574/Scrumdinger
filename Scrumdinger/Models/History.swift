//
//  History.swift
//  Scrumdinger
//
//  Created by Joseph DeWeese on 5/16/23.
//

import Foundation

struct History: Identifiable, Codable {
    let id: UUID
    let date: Date
    var exercises: [DailyWorkout.Exercise]
    var transcript: String?
    
    init(id: UUID = UUID(), date: Date = Date(), exercises: [DailyWorkout.Exercise], transcript: String? = nil) {
        self.id = id
        self.date = date
        self.exercises = exercises
        self.transcript = transcript
    }
}
