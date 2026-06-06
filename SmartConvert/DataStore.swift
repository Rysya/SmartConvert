class DataStore {
    var products: [Product] = [
        Product(title: "Вода", imageName: "water"),
        Product(title: "Молоко", imageName: "milk"),
        Product(title: "Мука", imageName: "flour"),
        Product(title: "Сахар", imageName: "sugar"),
        Product(title: "Соль", imageName: "salt"),
        Product(title: "Перец", imageName: "peper"),

        Product(title: "Растительное масло", imageName: "vegetable_oil"),
        Product(title: "Сливочное масло", imageName: "butter"),

        Product(title: "Рис", imageName: "rice"),
        Product(title: "Гречка", imageName: "buckwheat"),
        Product(title: "Овсяные хлопья", imageName: "oats"),

        Product(title: "Мёд", imageName: "honey"),
        Product(title: "Сметана", imageName: "sour_cream"),

        Product(title: "Какао", imageName: "cocoa"),
        Product(title: "Кофе", imageName: "coffee"),

        Product(title: "Разрыхлитель", imageName: "baking_powder"),
        Product(title: "Дрожжи", imageName: "yeast"),

        Product(title: "Яйцо", imageName: "egg")
    ]
    
    func append(product: Product) -> [Product] {
        var newProducts = products
        !newProducts.contains(where: { $0 == product })
            ? newProducts.append(product)
            : print("Такой продукт уже есть в списке")
        return newProducts
    }
    
    func delete(product: Product) -> [Product] {
        var newProducts = products
        newProducts.removeAll(where: { $0 == product })
        return newProducts
    }
}
