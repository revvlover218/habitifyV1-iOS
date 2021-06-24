//
//  AddHabitScreen.swift
//  HabitifyV1
//
//  Created by Reshal Luchman on 2021/05/25.
//

import SwiftUI

struct AddHabitScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var viewModel = AddHabitViewModel()
    
    private var isEditingHabit = false
    @State private var isPenaltySheetDisplayed = false
    
    init(with selectedHabit: HabitWrapperModel? = nil, isEditingHabit: Bool = false) {
        self.isEditingHabit = isEditingHabit
        viewModel.selectedHabit = selectedHabit
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                HABBackgroundGradientView()
                VStack {
                    Form {
                        Section(header: Text("Habit Details")) {
                            TextField("Habit Name", text: $viewModel.name)
                        }
                        
                        Section(header: Text("Progress Details")) {
                            Text("You have \(viewModel.daysCompleted) days completed")
                            Stepper("Add days already done?", value: $viewModel.daysCompleted, in: 0...21)
                        }
                        
                        if isEditingHabit {
                            Section(header: Text("Other")) {
                                Button(action: {
                                    isPenaltySheetDisplayed = true
                                }, label: {
                                    DestructiveButtonLabel(with: "Take a Penalty")
                                }).buttonStyle(PrimaryButtonStyle())
                                .padding([.top])
                                .actionSheet(isPresented: $isPenaltySheetDisplayed, content: {
                                    ActionSheet(title: Text("Select a penalty to take"),
                                                buttons: generateActionSheetItems())
                                })
                            }
                        }
                    }
                    VStack {
                        Spacer()
                        Button(action: {
                            if isEditingHabit {
                                viewModel.editExistingHabit()
                            } else {
                                viewModel.addNewHabit()
                            }
                            dismissView()
                        }, label: {
                            PrimaryButtonLabel(with: isEditingHabit ? "Save habit" : "Add new habit")
                        }).buttonStyle(PrimaryButtonStyle())
                    }
                }
                .navigationTitle(isEditingHabit ? "Edit Habit" : "New habit")
                .navigationBarTitleDisplayMode(isEditingHabit ? .inline : .automatic)
                .toolbar(content: {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button(action: {
                            hideKeyboard()
                        }, label: {
                            Image(systemName: "keyboard.chevron.compact.down")
                        })
                        Button(action: {
                            dismissView()
                        }, label: {
                            Text("Cancel")
                        })
                    }
                })
            }
        }
        .accentColor(.purple)
    }
    
    // MARK: - Private
    
    private func dismissView() {
        self.presentationMode.wrappedValue.dismiss()
    }
    
    private func generateActionSheetItems() -> [ActionSheet.Button] {
        var actionButtons = [ActionSheet.Button]()
        
        actionButtons.append(ActionSheet.Button.default(Text("Minor Penalty (3)")){
            if (viewModel.daysCompleted >= 3) {
                viewModel.daysCompleted -= 3
            } else {
                viewModel.daysCompleted = 0
            }
        })
        
        actionButtons.append(ActionSheet.Button.default(Text("Major Penalty (7)")){
            if (viewModel.daysCompleted >= 7) {
                viewModel.daysCompleted -= 7
            } else {
                viewModel.daysCompleted = 0
            }
        })
        
        actionButtons.append(ActionSheet.Button.destructive(Text("Reset (Back to 0)")){
            viewModel.daysCompleted = 0
        })
        
        actionButtons.append(ActionSheet.Button.cancel({
            isPenaltySheetDisplayed = false
        }))
        return actionButtons
    }
}

struct AddHabitScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitScreen()
        AddHabitScreen(isEditingHabit: true)
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
