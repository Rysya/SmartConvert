import Foundation

enum UnitType: String, Hashable, CaseIterable {
    // Кухонные меры
    case teaspoon = "ч.л."
    case tablespoon = "ст.л."
    case glass = "ст"
    
    // Масса
    case milligram = "мг"
    case gram = "г"
    case kilogram = "кг"
    case ton = "т"
    case ounce = "унц"
    case pound = "ф"
    
    // Объём
    case milliliter = "мл"
    case liter = "л"
    
    // Количество
    case piece = "шт"
}
