//
//  ContentView.swift
//  task-tracking-app
//
//  Created by Mathieu Dubart on 15/08/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var activities = Activities()
    
    @State private var showingAddActivity = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(activities.items) { item in
                        NavigationLink {
                            ActivityDetailsView(activities: activities, activity: item)
                        } label: {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    
                                    if !item.description.isEmpty {
                                        Text(item.description)
                                            .font(.subheadline)
                                    }
                                }
                                
                                Spacer()
                                HStack {
                                    Text(item.displayPriority)
                                        .font(.subheadline.bold())
                                        .foregroundStyle(.red)
                                    
                                    Text(String(item.timesCompleted))
                                        .frame(minWidth: 30)
                                        .padding(1)
                                        .background(.blue)
                                        .font(.caption.bold())
                                        .foregroundColor(.white)
                                        .clipShape(Capsule())
                                }
                            }
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
            }
            .navigationTitle("Tasks tracker")
            .toolbar {
                EditButton()
                
                Button {
                    showingAddActivity.toggle()
                } label: {
                    Label("New task", systemImage: "plus")
                }
            }
            .sheet(isPresented: $showingAddActivity) {
                AddActivityForm(activities: activities)
            }
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        activities.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
