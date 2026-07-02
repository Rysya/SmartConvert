import SwiftUI

struct UnitHStack: View {
    
    @Binding var selection: UnitType
    @Binding var text: String
    var placeholder: String
    var bgColor: Color
    var isDisabled: Bool = false
    
    var body: some View {
        HStack {
            if !isDisabled {
                SmartTextField(text: $text,
                               placeholder: placeholder,
                               bgColor: bgColor)
                    .keyboardType(UIKeyboardType.numberPad)
            } else {
                SmartTextField(text: $text,
                               placeholder: placeholder,
                               bgColor: bgColor)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.white)
                    .foregroundStyle(Color.white)
                    .disabled(true)
            }
            UnitPicker(selection: $selection)
        }
        .padding(5)
    }
}
