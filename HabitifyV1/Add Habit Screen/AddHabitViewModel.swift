//
//  AddHabitViewModel.swift
//  HabitifyV1
//
//  Created by Reshal Luchman on 2021/06/17.
//

import Foundation

final class AddHabitViewModel: ObservableObject {
    
    private var dateFormatter: DateFormatter?
    
    init() {
        dateFormatter = DateFormatter()
        dateFormatter?.dateStyle = .long
        dateFormatter?.timeStyle = .short
    }

    //Adding a new habit
    
    @Published var name = ""
    @Published var daysCompleted = 0
    @Published var lastModified = ""

    //Editing an existing habit
    
    @Published var selectedHabit: HabitWrapperModel? {
        didSet {
            name = selectedHabit?.name ?? ""
            daysCompleted = selectedHabit?.daysCompleted ?? 0
            lastModified = selectedHabit?.lastModified ?? ""
        }
    }
    
    func addNewHabit() {
        CoreDataManager.sharedInstance.addCoreDataHabit(with: HabitWrapperRequestModel(with: name,
                                                                                       daysCompleted: daysCompleted,
                                                                                       lastModified: updatedLastModifiedDate()))
    }
    
    func editExistingHabit() {
        guard let habit = selectedHabit else { return }
        CoreDataManager.sharedInstance.updateCoreDataHabit(with: name,
                                                           daysCompleted: daysCompleted,
                                                           lastModified: updatedLastModifiedDate(),
                                                           habit: habit)
    }
    
    // MARK: - Private
    
    private func updatedLastModifiedDate() -> String {
        return dateFormatter?.string(from: Date()) ?? ""
    }
}
