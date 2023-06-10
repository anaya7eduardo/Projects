//
//  FavCocktail.swift
//  CocktailFinal
//
//  Created by Eduardo Anaya on 1/6/22.
//

import Foundation
import CoreData

public class FavCocktail:NSManagedObject {
    @NSManaged var drinkFav: String
    @NSManaged var descriptionFav: String
    @NSManaged var instructionsFav: String
    @NSManaged var thumbFav: Data?
}
