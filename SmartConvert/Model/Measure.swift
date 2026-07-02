import Foundation

struct Measure {
    var id: String = UUID().uuidString
    var title: String
    var isWeight: Bool
    var coeff: Double //сколько в 1гр или в 1л
}
