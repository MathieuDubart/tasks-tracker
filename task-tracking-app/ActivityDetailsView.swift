//
//  ActivityDetailsView.swift
//  task-tracking-app
//
//  Created by Mathieu Dubart on 15/08/2023.
//

import SwiftUI

struct ActivityDetailsView: View {
    @ObservedObject var activities: Activities
    
    var activity: Activity
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        List {
            Section{
                if !activity.description.isEmpty {
                    Text(activity.description)
                }
            }
            
            Section {
                Text("Completion count: \(activity.timesCompleted)")
                
                Button("Mark completed") {
                    var newActivity = activity
                    newActivity.timesCompleted += 1
                    
                    if let index = activities.items.firstIndex(of: activity) {
                        activities.items[index] = newActivity
                    }
                }
            }
        }
        .navigationTitle(activity.name)
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    ActivityDetailsView(activities: Activities(), activity: Activity(name: "Test", description: "Loremp ipsum", priority: "Low"))
}
