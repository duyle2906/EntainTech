//
//  RaceListView.swift
//  PresentationLayer
//
//  Created by Duy Le on 19/6/2024.
//

import SwiftUI

struct RaceListView: View {
    var viewModel: RaceListViewModel
    let raceStartTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var currentTime: Date = Date.now
    
    var body: some View {
        List {
            ForEach(viewModel.displayedRaces) {
                race in
                RaceCellVew(race: race, currentTime: currentTime)
            }
        }.onReceive(raceStartTimer) { input in
            self.currentTime = input
        }
    }
}

#Preview {
    RaceListView(viewModel: RaceListViewModel())
}
