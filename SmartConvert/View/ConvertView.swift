import SwiftUI

struct ConvertView: View {
    private let products = DataStore().products
    
    @State private var countProduct: String = ""
    @State private var convertCountProduct: String = "0,00000"
    @State private var unitFrom = UnitType.gram
    @State private var unitTo = UnitType.gram
    @State private var selectProduct = DataStore().products.first ?? .none
    @State private var listProduct: [Product: Double] = [:]
    
    var body: some View {
        VStack {
            HStack {
                TextField("Количество", text: $countProduct)
                    .padding()
                    .background(.white)
                    .cornerRadius(16)
                    .shadow(radius: 1)
                Picker("", selection: $unitFrom) {
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
            .padding(5)
            HStack {
                TextField("0,00000", text: $convertCountProduct)
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(.black.opacity(0.5))
                    .font(Font.system(size: 20, weight: .medium, design: .default))
                    .foregroundColor(Color.white)
                    .cornerRadius(16)
                    .shadow(radius: 1)
                Picker("", selection: $unitTo) {
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
            .padding(5)
            Picker("", selection: $selectProduct) {
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
            Button("Посчитать") {
                convertCountProduct = countProduct.isEmpty ? "0,00000" : countProduct
                print("посчитал")
                print(convertCountProduct)
            }
                .padding(15)
                .foregroundColor(.white)
                .font(Font.system(size: 20, weight: .semibold, design: .default))
                .frame(maxWidth: .infinity)
                .background(.green)
                .cornerRadius(12)
                .padding(.horizontal ,10)
            Button("Запомнить") {
                
                guard let product = products.first(where: { $0.title == selectProduct?.title }) else {
                    print("Товар не найден")
                    return
                }

                listProduct[product] = Double(convertCountProduct.replacingOccurrences(of: ",", with: "."))
                
                print("запомнил")
                print(selectProduct!.title)
                print(product)
                print(listProduct)
            }
                .padding(15)
                .foregroundColor(.black)
                .font(Font.system(size: 20, weight: .semibold, design: .default))
                .frame(maxWidth: .infinity)
                .background(.yellow)
                .cornerRadius(12)
                .padding(.horizontal, 10)
            List(content: {
                ForEach(Array(listProduct).sorted(by: { $0.key.title < $1.key.title }), id: \.key.title) { cell in
                    HStack {
                        HStack {
                            Image(cell.key.imageName).resizable() .scaledToFill().frame(width: 30, height: 30)
                            Text(cell.key.title).padding(.horizontal, 10)
                        }
                        Spacer()
                        Text(String(format: "%.6f", cell.value))
                        Text(unitTo.rawValue)
                    }
                    .listRowBackground(
                        RoundedRectangle(cornerRadius: 0)
                                .fill(.white.opacity(0.7))
                        )
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button("Удалить") {
                            listProduct.removeValue(forKey: cell.key)
                            print("удалили")
                        }
                        .tint(.red)
                    }
                    
                }
            })
            .listStyle(.plain)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image("bg")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        )
    }
}

#Preview {
    ConvertView()
}
