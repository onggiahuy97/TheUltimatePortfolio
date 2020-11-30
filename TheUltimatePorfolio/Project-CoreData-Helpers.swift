//
//  Project-CoreData-Helpers.swift
//  TheUltimatePorfolio
//
//  Created by Huy Ong on 11/7/20.
//

import Foundation

extension Project {
    static let colors = ["Pink", "Purple", "Red", "Orange", "Gold", "Green", "Teal", "Light Blue", "Dark Blue", "Midnight", "Dark Gray", "Gray"]
    
    var projectTitle: String {
        title ?? "New Project"
    }
    
    var projectDetail: String {
        detail ?? ""
    }
    
    var projectColor: String {
        color ?? "Light Blue"
    }
    
    var projectItems: [Item] {
        items?.allObjects as? [Item] ?? []
    }
    
    var projectItemsDefaultSorted: [Item] {
        projectItems.sorted { s1, s2 in
            if s1.completed == false {
                if s2.completed == true {
                    return true
                }
            } else if s1.completed == true {
                if s2.completed == false {
                    return false
                }
            }
            
            if s1.priority > s2.priority {
                return true
            } else if s1.priority < s2.priority {
                return false
            }
            
            return s1.itemCreateDate < s2.itemCreateDate
        }
    }
    
    var completionAmount: Double {
        let originalItems = items?.allObjects as? [Item] ?? []
        guard originalItems.isEmpty == false else { return 0 }
        
        let completedItems = originalItems.filter(\.completed)
        return Double(completedItems.count) / Double(originalItems.count)
    }
    
    static var example: Project {
        let controller = DataController(inMemory: true)
        let viewContext = controller.container.viewContext
        let project = Project(context: viewContext)
        project.title = "Example Project"
        project.detail = "This is an example project"
        project.closed = true
        project.creationDate  = Date()
        
        return project
    }
    
    func projectItems(using sortOrder: Item.SortOrder) -> [Item] {
        switch sortOrder {
        case .title:
            return projectItems.sorted(by: \Item.itemTitle)
        case .creationDate:
            return projectItems.sorted(by: \Item.itemCreateDate)
        case .optimized:
            return projectItemsDefaultSorted
        }
    }
}
