//
//  DataController.swift
//  Comicsapp
//
//  Created by Samakab on 01/05/2023.
//

import Foundation
import CoreData

class DataController {
    let persistentContainer: NSPersistentContainer

    init(modelName: String) {
        persistentContainer = NSPersistentContainer(name: modelName)
    }

    func load(completion: (() -> Void)? = nil) {
        persistentContainer.loadPersistentStores { _, error in
            guard error == nil else {
                fatalError("Failed to load persistent stores: \(error!)")
            }
            completion?()
        }
    }

    func save() {
        if persistentContainer.viewContext.hasChanges {
            do {
                try persistentContainer.viewContext.save()
            } catch {
                print("Error saving context: \(error.localizedDescription)")
            }
        }
    }
}
