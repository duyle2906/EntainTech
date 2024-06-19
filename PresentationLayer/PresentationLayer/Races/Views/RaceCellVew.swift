//
//  RaceCellVew.swift
//  PresentationLayer
//
//  Created by Duy Le on 19/6/2024.
//

import SwiftUI
import DomainLayer

struct RaceCellVew: View {
    var race: Race
    var currentTime: Date
    
    init(race: Race, currentTime: Date) {
        self.race = race
        self.currentTime = currentTime
    }
    
    var body: some View {
        let countdown = (Int(race.startTimeInSeconds) - Int(currentTime.timeIntervalSince1970)).toTimeString()
        return HStack {
            Text("R\(race.raceNumber)")
                .font(.system(size: 14))
                .frame(width: 25, height: 10, alignment: .center)
                .padding()
                .overlay(
                    Circle()
                    .stroke(Color.orange, lineWidth: 1)
                    .padding(2)
                )
            Text(race.meetingName)
            Spacer()
            Text(countdown)
        }
    }
}

#Preview {
    RaceCellVew(race: Race(id: "00ef27df-93b2-4fd7-ae45-80bdcafe71bf", category: .greyhound, meetingName: "The Meadows", raceNumber: 1, startTimeInSeconds: TimeInterval(Date.now.timeIntervalSince1970 + 61)), currentTime: Date.now)
}
