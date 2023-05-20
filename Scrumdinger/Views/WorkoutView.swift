//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Joseph DeWeese on 4/22/23.
//

import SwiftUI
import AVFoundation


struct WorkoutView: View {
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
                WorkoutTimerView(speakers: workoutTimer.speakers, theme: workout.theme)
                WorkoutFooterView(speakers: workoutTimer.speakers, skipAction: workoutTimer.skipSpeaker)
                
                }
            }
            .padding()
            .foregroundColor(workout.theme.accentColor)
            .onAppear {
                startWorkout()
                }
            .onDisappear{
             endWorkout( )
            }
            .navigationBarTitleDisplayMode(.inline)
            
        }
private func startWorkout() {
       workoutTimer.reset(lengthInMinutes: workout.lengthInMinutes, exercises: workout.exercises)
       workoutTimer.speakerChangedAction = {
//           player.seek(to: .zero)
//           player.play()
       }
       workoutTimer.startWorkout()
   }
   
   private func endWorkout() {
       workoutTimer.stopWorkout()
       let newHistory = History(exercises: workout.exercises)
       workout.history.insert(newHistory, at: 0)
   }
}
struct WorkoutSessionScreen_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView(workout: .constant(DailyWorkout.sampleData[0]))
    }
}
