//
//  Activity.swift
//  task-tracking-app
//
//  Created by Mathieu Dubart on 15/08/2023.
//

import Foundation

struct Activity: Codable, Identifiable, Equatable {
    var id = UUID()
    var name: String
    var description: String
    var priority: String
    var timesCompleted = 0
    
    var displayPriority: String {
        if priority == "Low" {
            "!"
        }
        else if priority == "Medium" {
            "!!"
        }
        else {
            "!!!"
        }
    }
}
