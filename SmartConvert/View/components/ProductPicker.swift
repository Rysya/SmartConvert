import SwiftUI

struct ProductPicker: View {
    
    @Binding var selection: Product?
    var products: [Product]
    
    var body: some View {
        Picker("", selection: $selection) {
            ForEach(products, id: \.self) { product in
                    Text(product.title)
                        .tag(product)
                        .foregroundColor(.white)
            }
        }
        .pickerStyle(.wheel)
        .frame(maxWidth: .infinity, maxHeight: 200)
        .background(.black.opacity(0.5))
        .cornerRadius(24)
        .padding(.horizontal ,10)
    }
}
