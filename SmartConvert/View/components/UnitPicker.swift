import SwiftUI

struct UnitPicker: View {
    
    @Binding var selection: UnitType
    
    var body: some View {
        Picker("", selection: $selection) {
            ForEach(UnitType.allCases, id: \.self) { unit in
                    Text(unit.rawValue)
                        .tag(unit)
                        .foregroundColor(.black)
           }
        }
        .tint(.black)
        .foregroundColor(.black)
        .padding(10)
        .background(.white)
        .cornerRadius(16)
        .shadow(radius: 1)
    }
}
