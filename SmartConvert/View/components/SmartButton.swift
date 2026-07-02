import SwiftUI

struct SmartButton: View {
    
    let name: String
    let bgColor: Color
    let foregroundColor: Color
    let action: () -> ()
    
    var body: some View {
        Button(name) {
            action()
        }
            .padding(15)
            .foregroundColor(foregroundColor)
            .font(Font.system(size: 20, weight: .semibold, design: .default))
            .frame(maxWidth: .infinity)
            .background(bgColor)
            .cornerRadius(12)
            .padding(.horizontal, 10)
    }
}

#Preview {
    Button("Button", action: {})
}
