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
    case ounce = "унц"
    case pound = "ф"
    
    // Объём
    case milliliter = "мл"
    case liter = "л"
    
    // Количество
    case piece = "шт"
    
    var isWeight: Bool {
        switch self {
            case .milligram, .gram, .kilogram, .ounce, .pound:
                return true
            case .milliliter, .liter, .piece, .teaspoon, .tablespoon, .glass:
                return false
        }
    }
    
    /// Коэффициент относительно базовой единицы:
    /// масса → 1 г, объём → 1 мл, кухня → 1 мл
    var coeff: Double {
        switch self {
            // Кухонные меры (относительно 1 мл)
            case .teaspoon:   return 5.0      // 1 ч.л. = 5 мл
            case .tablespoon: return 15.0     // 1 ст.л. = 15 мл
            case .glass:      return 250.0    // 1 стакан = 250 мл

            // Объём (относительно 1 мл)
            case .milliliter: return 1.0
            case .liter:      return 1000.0   // 1 л = 1000 мл

            // Масса (относительно 1 г)
            case .milligram:  return 0.001    // 1 мг = 0.001 г
            case .gram:       return 1.0
            case .kilogram:   return 1000.0   // 1 кг = 1000 г
            case .ounce:      return 28.3495  // 1 унц = 28.3495 г
            case .pound:      return 453.592  // 1 ф = 453.592 г

            // Количество — коэффициент не применим
            case .piece:      return 1.0
        }
    }
}
