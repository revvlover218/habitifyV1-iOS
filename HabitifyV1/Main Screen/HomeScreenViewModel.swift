//
//  HomeScreenViewModel.swift
//  HabitifyV1
//
//  Created by Reshal Luchman on 2021/06/17.
//

import Foundation

final class HomeScreenViewModel: ObservableObject {
    
    @Published var habits: [HabitWrapperModel]?
    @Published var selectedHabit: HabitWrapperModel?
    
    var numberOfHabits: String {
        return String(habits?.count ?? 0)
    }
    
    func loadSavedHabits() {
        CoreDataManager.sharedInstance.loadSavedCoreDataHabits { habitList in
            self.habits = habitList
        }
    }
    
    func habitSelected(at index: Int) {
//        guard let habitSelected = habits?[index] else { return }
    }
    
    func deleteHabit(at index: Int) {
        guard let habitToDelete = habits?[index] else { return }
        habits?.remove(at: index)
        CoreDataManager.sharedInstance.delete(habit: habitToDelete)
    }
}
