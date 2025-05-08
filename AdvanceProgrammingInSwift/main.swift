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
class BaseClassDish {
    private let name: String
    private var ingredients: [String]
    
    //Create a memberwise initializer
    init(name: String, ingredients: [String]) {
        self.name = name
        self.ingredients = ingredients
    }
    
    //Define a method
    func printInfo() {
        print(self.name)
        print(self.ingredients)
    }
}

//Subclass the base class
final class AppetizerDish: BaseClassDish {
    //Override the base class method
    override func printInfo() {
        print("Appetizer")
        super.printInfo()
    }
}

//Create another child class
final class MainDish: BaseClassDish {}

//Create a for-loop
for _ in 0..<5 {
    let randomNumber = Int.random(in: 0...1)
    //Create a random dish
    let dish: BaseClassDish
    if randomNumber == 0 {
        dish = AppetizerDish(
            name: "Margherita Flatbread",
            ingredients: ["Margherita","Flatbread",]
        )
    } else {
        dish = MainDish(
            name: "Super Spaghetti",
            ingredients: ["Spaghetti","Tomato sauce",]
        )
    }
    
    //Downcasting using an if let statement
    if let appetizerDish = dish as? AppetizerDish {
        appetizerDish.printInfo()
    }
    
    //Type checking
    if dish is MainDish {
        print("Main Dish!")
    }
}

//Define a custom protocol
protocol ProtocolDish {
    //Define protocol properties requirements
    var name: String { get }
    var preparationMinutes: Int { get set }
    
    //Define protocol methods requirements
    func prepare()
    func plate(artisticLevel: Int)
}

//Adopt the custom protocol in a class
class MainProtocolDish: ProtocolDish {
    //Conform to the protocol properties requirements
    let name: String
    var preparationMinutes: Int
    
    //Create a memberwise initializer
    init(name: String, preparartionMinutes: Int) {
        self.name = name
        self.preparationMinutes = preparartionMinutes
    }
    
    //Conform to the protocol methods requirements
    func prepare() {
        print("Preparing \(name) for \(preparationMinutes) minutes")
    }
    func plate(artisticLevel: Int) {
        print("Plating artistic level: \(artisticLevel)")
    }
}

//Instantiate a MainDish class instance
let superSpaghetti = MainProtocolDish(name: "Super Spaghetti", preparartionMinutes: 35)

//Calling the prepare method
superSpaghetti.prepare()

//Calling the plate(artisticLevel :) method
superSpaghetti.plate(artisticLevel: 10)

//Add the driver protocol and delivery driver class instance
protocol Driver {
    var name: String { get }
    func driveToDestination(_ destination: String, with food: String)
}
class DeliveryDriver: Driver {
    var name: String
    init(name: String) {
        self.name = name
    }
    func driveToDestination(_ destination: String, with food: String) {
        print("\(name) is driving to \(destination) to deliver \(food).")
    }
}

//Create a Little Lemon class instance
class LittleLemon {
    //Add a variable property
    var deliveryDriver: Driver?
    
    //Define a food delivery method
    func devileryFood(_ food: String, to destination: String) {
        //Unwrapping the delegate
        if let deliveryDriver = deliveryDriver {
            //Delegate the food delivery functionality
            deliveryDriver.driveToDestination(destination, with: food)
        } else { //Handling the else statement
            print("No delivery driver.")
        }
    }
}

// Instantiate a delivery driver
let mike = DeliveryDriver(name: "Mike")

//Instantiate the Little Lemon restaurant
let littleLemon = LittleLemon()

//Call the food delivery method
littleLemon.devileryFood(superSpaghetti.name, to: "Your house")

//Assign a delivery driver to Little Lemon
littleLemon.deliveryDriver = mike

//Assign a delivery driver to Little Lemon
littleLemon.devileryFood(superSpaghetti.name, to: "Your house")

//Create a custom enumeration for errors
enum CalculatorError: Error {
    case divisionByZero
}

//Create a class to represent a calculator
class Calculator {
    // Create a division function
    func divide(x: Double, y: Double) throws -> Double {
        
        //Check for division by zero inside your function and throw an error
        if y == 0 {
            throw CalculatorError.divisionByZero
        }
        
        return x / y
    }
}

//Initialize the class to a constant
let calculator = Calculator()

//Use do-catch on your function call to handle thrown errors
do {
    //Call the function to divide two numbers
    let successfulResult = try calculator.divide(x: 1, y: 2)
    print(successfulResult)
    
    //Create success and failure scenarios for calling the division function
    let invalidResult = try calculator.divide(x: 1, y: 0)
} catch CalculatorError.divisionByZero {
    print("Division by zero detected and not allowed")
}

//Add Order struct
struct Order {
    let price: Int
    let location: String
}
 
func totalRevenueOf(orders: [Order],  location: String) -> Int {
    return 0
}
 
let orders = [
    Order(price: 24, location: "New York"),
    Order(price: 37, location: "San Francisco"),
    Order(price: 101, location: "New York"),
]
 
let result = totalRevenueOf(orders: orders, location: "New York")
