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
    @State private var isPenaltySheetDisplayed = false
    
    private var isEditingHabit = false
    
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
                        
                        ProgressDetailsView(with: $viewModel.daysCompleted)
                        
                        if isEditingHabit {
                            
                            Section(header: Text("Updates")) {
                                Text("Habit last updated: \(viewModel.lastModified)")
                            }
                            
                            Section(header: Text("Other")) {
                                Button(action: {
                                    isPenaltySheetDisplayed = true
                                }, label: {
                                    HABDestructiveButtonLabel(with: "Take a Penalty")
                                })
                                .buttonStyle(HABPrimaryButtonStyle())
                                .padding([.top])
                                .actionSheet(isPresented: $isPenaltySheetDisplayed, content: {
                                    ActionSheet(title: Text("Select a penalty to take"),
                                                buttons: generateActionSheetItems())
                                })
                            }
                        }
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
                VStack {
                    Spacer()
                    Button(action: {
                        isEditingHabit ? viewModel.editExistingHabit() : viewModel.addNewHabit()
                        dismissView()
                    }, label: {
                        HABPrimaryButtonLabel(with: isEditingHabit ? "Save habit" : "Add new habit")
                    })
                    .buttonStyle(HABPrimaryButtonStyle())
                }
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
        
        actionButtons.append(ActionSheet.Button.default(Text("Minor Penalty (3)")) {
            if (viewModel.daysCompleted >= 3) {
                viewModel.daysCompleted -= 3
            } else {
                viewModel.daysCompleted = 0
            }
        })
        
        actionButtons.append(ActionSheet.Button.default(Text("Major Penalty (7)")) {
            if (viewModel.daysCompleted >= 7) {
                viewModel.daysCompleted -= 7
            } else {
                viewModel.daysCompleted = 0
            }
        })
        
        actionButtons.append(ActionSheet.Button.destructive(Text("Reset (Back to 0)")) {
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

struct ProgressDetailsView: View {
    
    @Binding var daysCompleted: Int
    
    init(with daysCompleted: Binding<Int>) {
        self._daysCompleted = daysCompleted
    }
    
    var body: some View {
        Section(header: Text("Progress Details")) {
            Text("You have \(daysCompleted) days completed")
            Stepper("Add days already done?", value: $daysCompleted, in: 0...21)
        }
    }
}
