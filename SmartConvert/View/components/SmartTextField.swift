import SwiftUI

struct SmartTextField: View {
    
    @Binding var text: String
    let placeholder: String
    let bgColor: Color
    
    var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .background(bgColor)
            .font(Font.system(size: 20, weight: .medium, design: .default))
            .cornerRadius(16)
            .shadow(radius: 1)
    }
}
