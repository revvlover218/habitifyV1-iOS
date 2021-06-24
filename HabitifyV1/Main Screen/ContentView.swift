//
//  ContentView.swift
//  HabitifyV1
//
//  Created by Reshal Luchman on 2021/05/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = HomeScreenViewModel()
    @State private var shouldShowAddNewHabitScreen = false
    @State private var shouldShowEditHabitScreen = false
    @State private var shouldShowDeleteAlert = false
    
    init() {
        #warning("SwiftUI 2.0: Transparent backgrounds not available yet in this version of SwiftUI for lists, forms")
        UITableView.appearance().backgroundColor = .clear
        //        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            HABBackgroundGradientView()
            VStack(alignment: .leading) {
                HABProfileHeaderContentView(with: "Reshal", description: "You have \(viewModel.numberOfHabits) habits to practice")
                Spacer()
                //Bindable lists is not currently possible in xcode 12 or swiftUI 1.0. It is available from xcode 13 onwards.
                List {
                    ForEach(viewModel.habits ?? []) { habit in
                        Button(action: {
                            viewModel.selectedHabit = habit
                            self.shouldShowEditHabitScreen = true
                        }, label: {
                            HABHabitContentViewCell(with: habit.name, daysCompleted: habit.daysCompleted)
                        })
                        .buttonStyle(HABPrimaryButtonStyle())
                        .fullScreenCover(isPresented: $shouldShowEditHabitScreen, onDismiss: {
                            self.shouldShowEditHabitScreen = false
                            viewModel.loadSavedHabits()
                        }, content: {
                            AddHabitScreen(with: viewModel.selectedHabit!, isEditingHabit: true)
                        })
                    }
                    .onDelete(perform: deleteHabit(at:))
                    .listRowBackground(Color.clear)
                }
            }
            VStack {
                Spacer()
                Button(action: {
                    self.shouldShowAddNewHabitScreen = true
                }, label: {
                    HABPrimaryButtonLabel(with: "Add new habit")
                })
                .buttonStyle(HABPrimaryButtonStyle())
                .sheet(isPresented: $shouldShowAddNewHabitScreen, onDismiss: {
                    self.shouldShowAddNewHabitScreen = false
                    viewModel.loadSavedHabits()
                }, content: {
                    AddHabitScreen()
                })
            }
        }.onAppear(perform: {
            viewModel.loadSavedHabits()
        })
    }
    
    // MARK: - Private
    
    private func deleteHabit(at indexOffsets: IndexSet) {
        indexOffsets.forEach { index in
            viewModel.deleteHabit(at: index)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
