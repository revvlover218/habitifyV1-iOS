//
//  HABHabitContentViewCell.swift
//  HabitifyV1
//
//  Created by Reshal Luchman on 2021/06/17.
//

import SwiftUI

struct HABHabitContentViewCell: View {
    
    private var habitName: String?
    private var daysCompleted: Int?

    init(with habitName: String, daysCompleted: Int) {
        self.habitName = habitName
        self.daysCompleted = daysCompleted
    }
        
    var body: some View {
        ZStack(alignment: .leading) {
            Color(.black)
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text(habitName ?? "")
                        .font(.headline)
                        .foregroundColor(.white)
                        .bold()
                    Text(generateProgressDescription(with: daysCompleted ?? 0))
                        .font(.subheadline)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .foregroundColor(.secondary)
                }.padding()
                Spacer()
                VStack {
                    Text(String(daysCompleted ?? 0))
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .bold()
                        .padding([.horizontal])
                    Text("days")
                        .font(.subheadline)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .foregroundColor(.secondary)
                }
            }
        }
        .frame(height: 80)
        .cornerRadius(20)
        .padding([.top, .bottom])
        .shadow(radius: 10)
        .background(Color.clear)
    }
}

struct HABHabitContentViewCell_Previews: PreviewProvider {
        
    static var previews: some View {
        List {
            HABHabitContentViewCell(with: "Habit name", daysCompleted: 0)
            HABHabitContentViewCell(with: "Habit name", daysCompleted: 1)
            HABHabitContentViewCell(with: "Habit name", daysCompleted: 2)
            HABHabitContentViewCell(with: "Habit name", daysCompleted: 3)
            HABHabitContentViewCell(with: "Habit name", daysCompleted: 20)
            HABHabitContentViewCell(with: "Habit name", daysCompleted: 21)
        }
    }
}

private extension HABHabitContentViewCell {
    
    func generateProgressDescription(with daysCompleted: Int) -> String {
        return "\(21 - daysCompleted) days to go"
//        if daysCompleted == 0 {
//            return "Habit not started"
//        } else if daysCompleted == 1 {
//            return "1 day completed"
//        } else if daysCompleted > 1 && daysCompleted <= 2 {
//            return "\(daysCompleted) days completed"
//        } else if daysCompleted > 2 && daysCompleted < 21 {
//            return streakGenerator(number: daysCompleted)
//        } else if daysCompleted == 21 {
//            return "Habit Complete! Well done"
//        } else {
//            return "\(daysCompleted)"
//        }
    }
    
    private func streakGenerator(number: Int) -> String {
        var streak = ""
        streak.append("\(number-2) ")
        streak.append("\(number-1) ")
        streak.append("\(number) ")
        streak.append("\(number+1) ")
        
        if number < 20 {
            streak.append("\(number+2)")
        }
        return streak
    }
}
