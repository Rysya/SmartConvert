import Combine
import SwiftUI

class ConvertViewModel: ObservableObject {
    
    var products: [Product] = []
    
    @Published var countProduct: String = ""
    @Published var convertCountProduct: String = "0.00000"
    @Published var unitFrom: UnitType = .gram
    @Published var unitTo: UnitType = .gram
    @Published var selectProduct: Product?/* = products.first*/
    @Published var listProduct: [IngredientEntry] = []
    @Published var sliderValue: Double = 50.0
    
    
    //MARK: конвертация
    private func convert() -> String {
        guard let ingredient = selectProduct else { return "Нет ингредиентов" }
        guard let value = Double(countProduct) else { return "Неверные входные данные" }

        let convertCountProduct: Double
        switch (unitTo.isWeight, unitFrom.isWeight) {
            case (true, true):   // Масса → Масса
                convertCountProduct = value * unitFrom.coeff / unitTo.coeff
            case (false, false): // Объём → Объём
                convertCountProduct = value * unitFrom.coeff / unitTo.coeff
            case (true, false):  // Объём → Масса
                convertCountProduct = value * unitFrom.coeff * ingredient.density / unitTo.coeff
            case (false, true):  // Масса → Объём
                convertCountProduct = value * unitFrom.coeff / ingredient.density / unitTo.coeff
        }

        return String(convertCountProduct)
    }
    
    //MARK: сохранить
    func save() {
        guard let product = products.first(where: { $0.title == selectProduct?.title }) else {
            print("Товар не найден")
            return
        }
        let amount = Double(convertCountProduct.replacingOccurrences(of: ",", with: ".")) ?? 0.0
        let unit = unitTo
        listProduct.append(IngredientEntry(product: product, amount: amount, unit: unit))
    }
    
    //MARK: посчитать
    func convertCount() {
        convertCountProduct = countProduct.isEmpty ? "0,00000" : convert()
    }
    
    //MARK: получить продукты
    func getAllProducts() {
        self.products = RealmService.shared.getProducts()
        selectProduct = products.first
    }
    
    //MARK: удаление
    func delete(at id: String) {
        listProduct.removeAll { $0.id == id }
        print("удалили")
    }
}
