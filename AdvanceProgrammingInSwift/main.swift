//
//  main.swift
//  AdvanceProgrammingInSwift
//
//  Created by Trung Luu on 5/2/25.
//

import Foundation

//Define enum with raw values
enum Ingredient: String {
    case lettuce = "Romaine Lettuce"
    case croutons = "Salted Croutons"
    case chicken = "Free Range Chicken"
}

//Create a new constant to hold one of the enumeration cases
let ingredient: Ingredient = .lettuce

//Create a switch statement to print information about each enumeration case
switch ingredient {
case .lettuce:
    print("We use \(ingredient.rawValue) that has the richest flavor from all the lettuces.")
case .croutons:
    print("We sprinkle \(ingredient.rawValue) on top of our salads for added crunch.")
case .chicken:
    print("We grill or roast \(ingredient.rawValue) to add protein to our salads.")
}

//Create a new enumeration to represent the allergens
enum RecipeInformation {
    case allergens(information: String)
}

//Define a constant to represent the recipe information
let recipeInformation: RecipeInformation = .allergens(information: "Peanut, Milk, Gluten")

//Create a switch statement to print the allergens information
switch recipeInformation {
case .allergens(let allergens):
    print("The meal includes the following allergens: \(allergens)")
}

//Declare sets for each booking method
let reserveInPerson: Set = ["000-345-3441","000-325-3443"]
let reserveOverPhone: Set = ["000-345-3443", "000-345-5223"]
let reserveOnline: Set = ["000-345-6223", "000-345-7223"]

//Combine all the sets into a single set of all numbers
let inPersonAndOverPhone = reserveInPerson.union(reserveOverPhone)
print(inPersonAndOverPhone)
var allPhoneNumbers = inPersonAndOverPhone.union(reserveOnline)
print(allPhoneNumbers)

//Create a Set for the reservation codes
var confirmationCodes: Set = ["LL3450","LL3451","LL3452", "LL3453", "LL3454"]

//Compare the number of codes to the number of phone numbers
print("\(allPhoneNumbers.count) \(confirmationCodes.count)")

//Insert more confirmation codes if it is fewer than phone numbers
confirmationCodes.insert("LL3455")
print(confirmationCodes)

//Remove the confirmation code and phone number for canceled reservations
confirmationCodes.remove("LL3451")
allPhoneNumbers.remove("000-345-3443")

print("\(allPhoneNumbers.count) \(confirmationCodes.count)")

//Create a base class
class Dish {
    private let name: String
    private var ingredients: [String]
    
    //Create a memberwise initializer
    init(name: String, ingredients: [String]) {
        self.name = name
        self.ingredients = ingredients
    }
    
    //Define a method
    func printInfo() {
        
    }
}
