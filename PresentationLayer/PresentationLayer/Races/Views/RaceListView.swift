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

    private let raceStartTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private let fetchNextRacesTimer = Timer.publish(every: 30, on: .main, in: .common).autoconnect()

    public init(viewModel: RaceListViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        NavigationView {
            VStack {
                RaceCategoriesView(categories: $viewModel.selectedCategories)
                    .padding(.top)
                List {
                    ForEach(viewModel.selectedCategories) {
                        category in
                        if category.isSelected {
                            Section(header:
                                HStack {
                                    Text(category.category.rawValue)
                                        .font(.title3.bold())
                                        .foregroundStyle(.white)
                                        .padding(10)
                                    Spacer()
                                }
                                .background(.gray)
                                .listRowInsets(EdgeInsets(
                                    top: 0,
                                    leading: 0,
                                    bottom: 0,
                                    trailing: 0)
                                )
                                .accessibilityElement(children: .contain)
                                .accessibilityIdentifier("\(ViewIdentifiers.Races.section)_\(category.category.rawValue)")
                            ) {
                                ForEach(viewModel.displayedRaces.filter({ $0.category == category.category })) {
                                    race in
                                    RaceCellVew(race: race, currentTime: currentTime)
                                }
                            }
                            .listSectionSeparator(.hidden)
                            .listRowInsets(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                        }
                    }
                }
                .listStyle(.plain)
                .padding(.top, -10)
                .accessibilityIdentifier(ViewIdentifiers.Races.list)
                .onAppear {
                    Task {
                        await viewModel.getNextRaces()
                        viewModel.checkExpiredRaces(currentTime: currentTime)
                    }
                }
                .onReceive(raceStartTimer) { input in
                    currentTime = input
                    viewModel.checkExpiredRaces(currentTime: currentTime)
                }
                .onReceive(fetchNextRacesTimer) { _ in
                    // fetch next races every 30 seconds
                    Task {
                        await viewModel.getNextRaces()
                        viewModel.checkExpiredRaces(currentTime: currentTime)
                    }
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Next to Go")
                        .bold()
                        .font(.largeTitle)
                }
            })
        }
    }
}

#Preview {
    ViewResolverMock().getRaceListView()
}
