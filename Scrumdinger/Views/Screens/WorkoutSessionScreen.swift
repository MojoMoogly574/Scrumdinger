//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Joseph DeWeese on 4/22/23.
//

import SwiftUI
import AVFoundation


struct WorkoutSessionScreen: View {
    //MARK:  PROPERTIES
    @Binding var workout:  DailyWorkout
    @StateObject var workoutTimer = WorkoutTimer()
    
  //  private var player: AVPlayer { AVPlayer.sharedDingPlayer }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(workout.theme.mainColor)
            VStack {
                WorkoutHeaderView(secondsElapsed: workoutTimer.secondsElapsed, secondsRemaining: workoutTimer.secondsRemaining, theme: workout.theme)
         
                Circle()
                    .strokeBorder(lineWidth: 24)
                WorkoutFooterView(speakers: workoutTimer.speakers, skipAction: workoutTimer.skipSpeaker)
                //MARK: NEXT EXERCISE BUTTON
            }
        }
        .padding()
        .foregroundColor(workout.theme.accentColor)
        .onAppear {
                
                    workoutTimer.startWorkout()
                }
        .onDisappear{
            workoutTimer.stopWorkout()
            let newHistory = History(exercises: workout.exercises)
                        workout.history.insert(newHistory, at: 0)
        }
        .navigationBarTitleDisplayMode(.inline)
        
    }
}
struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutSessionScreen(workout: .constant(DailyWorkout.sampleData[0]))
    }
}
