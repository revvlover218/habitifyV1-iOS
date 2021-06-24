//
//  AddHabitViewModel.swift
//  HabitifyV1
//
//  Created by Reshal Luchman on 2021/06/17.
//

import Foundation

final class AddHabitViewModel: ObservableObject {
    
    //Adding a new habit
    
    @Published var name = ""
    @Published var daysCompleted = 0
    
    //Editing an existing habit
    
    @Published var selectedHabit: HabitWrapperModel? {
        didSet {
            name = selectedHabit?.name ?? ""
            daysCompleted = selectedHabit?.daysCompleted ?? 0
        }
    }
    
    func addNewHabit() {
        CoreDataManager.sharedInstance.addCoreDataHabit(with: HabitWrapperRequestModel(with: name, daysCompleted: daysCompleted))
    }
    
    func editExistingHabit() {
        guard let habit = selectedHabit else { return }
        CoreDataManager.sharedInstance.updateCoreDataHabit(with: name, daysCompleted: daysCompleted, habit: habit)
    }
}
