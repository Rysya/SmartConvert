import Foundation
import RealmSwift

class ConvertResult: Object, Identifiable {
    
    @Persisted(primaryKey: true) var id: String = ""
    @Persisted var product: Product?
    @Persisted var total: Double
    
    convenience init(product: Product, total: Double) {
        self.init()
        self.id = UUID().uuidString
        self.product = product
        self.total = total
    }
}
