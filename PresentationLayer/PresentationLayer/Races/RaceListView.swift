//
//  RaceListView.swift
//  PresentationLayer
//
//  Created by Duy Le on 19/6/2024.
//

import SwiftUI

public struct RaceListView: View {
    @ObservedObject var viewModel: RaceListViewModel
    @State private var currentTime: Date = Date.now
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    public var body: some View {
        List {
            ForEach(viewModel.displayedRaces) {
                race in
                RaceCellVew(race: race, currentTime: currentTime)
            }
        }
        .onAppear() {
            Task {
                await viewModel.getNextRaces()
            }
        }
        .onReceive(timer) { input in
            currentTime = input
            viewModel.checkExpiredRaces(currentTime: currentTime)
        }
    }
}

#Preview {
    ViewResolverMock().getRaceListView()
}
