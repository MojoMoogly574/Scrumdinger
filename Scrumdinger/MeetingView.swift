//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Joseph DeWeese on 4/22/23.
//

import SwiftUI

struct MeetingView: View {
    var body: some View {
        VStack {
            Circle()
                .strokeBorder(lineWidth: 24)
                .padding()
            //MARK: ELAPSED TIME PROGRESS VIEW
            ProgressView(value: 5, total: 15)
            HStack{
                VStack{
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("300", systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing){
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("600", systemImage: "hourglass.bottomhalf.fill")
                }//VSTACK
            }//HSTACK
            .padding()
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Time remaining")
            .accessibilityValue("10 minutes")
            //MARK: NEXT EXERCISE BUTTON
            HStack{
                Text("Exercise 1 of 3")
                Spacer()
                Button(action: {}) {
                    Image(systemName: "forward.fill")
                }
                .accessibilityLabel("Next exercise")
            }//HSTACK
            .padding()
        }//VSTACK
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView()
    }
}
