//
//  AddActivityForm.swift
//  task-tracking-app
//
//  Created by Mathieu Dubart on 15/08/2023.
//

import SwiftUI

struct AddActivityForm: View {
    @ObservedObject var activities: Activities
    @Environment(\.dismiss) var dismiss
    
    @State private var name: String = ""
    @State private var description: String = ""
    @State private var priority: String = "Low"
    
    let priorityLevels = ["Low", "Medium", "High"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Activity name", text: $name)
                TextField("Description", text: $description)
                
                Picker("Priority", selection: $priority) {
                    ForEach(priorityLevels, id: \.self) { level in
                        Text(level)
                    }
                }
            }
            .navigationTitle("Add a task")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                Button {
                    let trimmedName = name.trimmingCharacters(in: .whitespaces)
                    guard !trimmedName.isEmpty else { return }
                    
                    let trimmedDescription = description.trimmingCharacters(in: .whitespaces)
                    
                    let activity = Activity(name: trimmedName, description: trimmedDescription, priority: priority)
                    activities.items.append(activity)
                    dismiss()
                } label: {
                    Label("Save", systemImage: "square.and.arrow.down")
                }
                
                Button {
                    dismiss()
                } label: {
                    Label("Cancel", systemImage: "trash")
                }
                .tint(.red)
            }
        }
    }
}

#Preview {
    AddActivityForm(activities: Activities())
}
