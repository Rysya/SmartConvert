import Foundation
import RealmSwift

struct IngredientEntry: Identifiable {
    let id = UUID().uuidString
    var product: Product
    var amount: Double
    var unit: UnitType
}
