//
//  CoreDataManager.swift
//  HabitifyV1
//
//  Created by Reshal Luchman on 2021/06/17.
//

import Foundation
import CoreData

typealias HabitListFetched = (_ habitList: [HabitWrapperModel]?) -> Void

class CoreDataManager {
    
    private var persistanceContainer: NSPersistentContainer
    private  var viewContext: NSManagedObjectContext {
        return persistanceContainer.viewContext
    }
    
    static let sharedInstance = CoreDataManager()
    
    private init() {
        persistanceContainer = NSPersistentContainer(name: "HabitiftyCoreDataModel")
        persistanceContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to retrieve data from core data stack. Error: \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: - Load Data
    
    func loadSavedCoreDataHabits(with success: @escaping HabitListFetched) {
        let request: NSFetchRequest<CoreDataHabitListModel> = CoreDataHabitListModel.fetchRequest()
        do {
            let coreDataHabitList = try viewContext.fetch(request)
            let habitList = coreDataHabitList.map({ HabitWrapperModel(coreDataHabit: $0) })
            success(habitList)
        } catch {
            success(nil)
        }
    }
    
    // MARK: - Save

    func saveCoreData() {
        do {
            try viewContext.save()
        } catch {
            viewContext.rollback()
            print("Fatal error when saving core data context: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Delete
    
    func delete(habit: HabitWrapperModel) {
        viewContext.delete(habit.coreDataHabit)
        saveCoreData()
    }
    
    // MARK: - Add
    
    func addCoreDataHabit(with habitRequest: HabitWrapperRequestModel) {
        let habits = CoreDataHabitListModel(context: viewContext)
        habits.habitName = habitRequest.name
        habits.daysCompleted = Int16(habitRequest.daysCompleted ?? 0)
        saveCoreData()
    }
    
    // MARK: - Edit
    
    func updateCoreDataHabit(with name: String, daysCompleted: Int, habit: HabitWrapperModel) {
        habit.coreDataHabit.habitName = name
        habit.coreDataHabit.daysCompleted = Int16(daysCompleted)
        saveCoreData()
    }
}

// MARK: - HabitWrapperModel

struct HabitWrapperModel: Identifiable, Hashable {
    let id = UUID()
    var coreDataHabit: CoreDataHabitListModel
    var name: String {
        return coreDataHabit.habitName ?? ""
    }
    var daysCompleted: Int {
        return Int(coreDataHabit.daysCompleted)
    }
}

// MARK: - HabitWrapperRequestModel

struct HabitWrapperRequestModel {
    var name: String?
    var daysCompleted: Int?
    
    init(with name: String, daysCompleted: Int) {
        self.name = name
        self.daysCompleted = daysCompleted
    }
}
