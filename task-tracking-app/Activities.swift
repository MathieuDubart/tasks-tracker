//
//  Activities.swift
//  task-tracking-app
//
//  Created by Mathieu Dubart on 15/08/2023.
//

import Foundation

class Activities: ObservableObject {
    @Published var items = [Activity]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.setValue(encoded, forKey: "Activities")
            }
        }
    }
    
    init() {
        if let savedActivities = UserDefaults.standard.data(forKey: "Activities") {
            if let decodedItems = try? JSONDecoder().decode([Activity].self, from: savedActivities) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
    
}
