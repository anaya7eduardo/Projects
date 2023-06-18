//
//  CoreDataViewModel.swift
//  GetACocktail
//
//  Created by unkn0wn on 3/30/23.
//

import CoreData
import SwiftUI

class CoreDataViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    
    @Published var savedEntities: [CocktailEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "CocktailContainer")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error Loading Core Data: \(error.localizedDescription)")
            }
        }
        fetchCocktails()
    }
    
    func fetchCocktails() {
        let fetchRequest = NSFetchRequest<CocktailEntity>(entityName: "CocktailEntity")
        do {
            savedEntities = try container.viewContext.fetch(fetchRequest)
        } catch let error {
            print("Error Fetching Core Data: \(error.localizedDescription)")
        }
    }
    
    func addCocktail(name: String, thumb: String, details: String, ingredients: String, recipe: String) {
        let newCocktail = CocktailEntity(context: container.viewContext)
        newCocktail.name = name
        newCocktail.thumb = thumb
        newCocktail.details = details
        newCocktail.ingredients = ingredients
        newCocktail.recipe = recipe
        saveData()
    }
    
    func deleteCocktail(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        saveData()
    }
    
    func deleteAllCocktails() {
        let fetchRequest: NSFetchRequest<CocktailEntity> = NSFetchRequest(entityName: "CocktailEntity")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest as! NSFetchRequest<NSFetchRequestResult>)
        do {
            try container.viewContext.execute(deleteRequest)
            saveData()
        } catch let error {
            print("Error Deleting Data: \(error.localizedDescription)")
        }
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchCocktails()
        } catch let error {
            print("Error Saving Data: \(error.localizedDescription)")
        }
    }
}
