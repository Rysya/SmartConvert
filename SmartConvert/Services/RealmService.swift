import Foundation
import RealmSwift

class RealmService {
    static let shared = RealmService(); private init() {} //сингл тон, чтобы не создавать кучу копий , чтобы во всем приложении был один сервис
    private let db = try! Realm()  //форсанврап для того чтобы сразу приложение упало, если не создалась бд
    
    var config: Realm.Configuration {
        db.configuration
    }
    
    //MARK: init data
    static func seedDatabaseIfNeeded() {
            let realm = try! Realm()
            
            // Проверяем, есть ли уже данные
            if realm.objects(Product.self).isEmpty {
                do {
                    try realm.write {
                        let defaultProducts = [
                            Product(title: "Вода",             imageName: "water",         density: 1.0),
                            Product(title: "Молоко",           imageName: "milk",          density: 1.03),
                            Product(title: "Мука",             imageName: "flour",         density: 0.53),
                            Product(title: "Сахар",            imageName: "sugar",         density: 0.85),
                            Product(title: "Соль",             imageName: "salt",          density: 1.2),
                            Product(title: "Перец",            imageName: "peper",         density: 0.5),

                            Product(title: "Растительное масло", imageName: "vegetable_oil", density: 0.92),
                            Product(title: "Сливочное масло",  imageName: "butter",        density: 0.911),

                            Product(title: "Рис",              imageName: "rice",          density: 0.85),
                            Product(title: "Гречка",           imageName: "buckwheat",     density: 0.8),
                            Product(title: "Овсяные хлопья",   imageName: "oats",          density: 0.35),

                            Product(title: "Мёд",              imageName: "honey",         density: 1.42),
                            Product(title: "Яйцо",             imageName: "egg",           density: 1.03),
                            Product(title: "Сметана",          imageName: "sour_cream",    density: 1.05),

                            Product(title: "Какао",            imageName: "cocoa",         density: 0.55),
                            Product(title: "Кофе",             imageName: "coffee",        density: 0.35),

                            Product(title: "Разрыхлитель",     imageName: "baking_powder", density: 0.9),
                            Product(title: "Дрожжи",           imageName: "yeast",         density: 0.5),
                        ]
                        realm.add(defaultProducts)
                    }
                    print("База заполнена начальными данными")
                } catch {
                    print("Ошибка заполнения базы: \(error)")
                }
            } else {
                print("данные уже заполнены, снова не заполняем")
            }
        }
    
    
    //MARK: CRUD (create-retrive-update-delete) Operations
    func createProduct(product: Product, completion: () -> ()) {
        do {
            try db.write {
                db.add(product)
                completion()
            }
        } catch {
            print("BD write not worked")
        }
    }
    
    //MARK: Retrive
    func getProducts() -> [Product] {
        let productList = db.objects(Product.self)
        return Array(productList)
    }
    
    //MARK: Update
//    func updStatus(_ value: Bool, for product: Product, completion: () -> ()) {
//        do {
//            try db.write {
//                todo.completed = value
//                completion()
//            }
//        } catch {
//            print("BD update not worked")
//        }
//    }
    
//    func updateToDo(_ oldTodo: ToDo, newTodo: ToDo,  completion: () -> ()) {
//        do {
//            try db.write {
//                oldTodo.title = newTodo.title
//                oldTodo.taskDescription = newTodo.taskDescription
//                oldTodo.deadline = newTodo.deadline
//                oldTodo.category = newTodo.category
////                if let existingToDo = db.object(ofType: ToDo.self, forPrimaryKey: todo.id) {
////                    existingToDo.title = todo.title
////                    existingToDo.taskDescription = todo.taskDescription
////                    existingToDo.deadline = todo.deadline
////                    existingToDo.category = todo.category
////                }
//                completion()
//            }
//        } catch {
//            print("BD update not worked")
//        }
//    }
    
    //MARK: Delete
    func deleteProduct(product: Product, completion: () -> ()) {
        do {
            try db.write {
                db.delete(product)
                completion()
            }
        } catch {
            print("BD delete not worked")
        }
    }
    
}
