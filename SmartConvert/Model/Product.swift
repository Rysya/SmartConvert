import Foundation
import RealmSwift

@MainActor
class Product: Object, Identifiable {
    @Persisted(primaryKey: true) var id: String
    @Persisted var title: String
    @Persisted var imageName: String
    @Persisted var density: Double
    
    convenience init(title: String, imageName: String, density: Double) {
        self.init()
        self.id = UUID().uuidString
        self.title = title
        self.imageName = imageName
        self.density = density
    }
}

//не понятно откуда вязлся mainActor(и в классе тоже) , для чего nonisolated,  MainActor.assumeIsolated
extension Product {
    nonisolated override var description: String {
        MainActor.assumeIsolated {
            "\(self.title)" }
        }
}
