import SwiftUI
import RealmSwift

struct ConvertView: View {
    
    @StateObject var viewModel = ConvertViewModel()
    
    var body: some View {
        VStack {
            UnitHStack(selection: $viewModel.unitFrom,
                       text: $viewModel.countProduct,
                       placeholder: "Количество",
                       bgColor: .white)
            UnitHStack(selection: $viewModel.unitTo,
                       text: $viewModel.convertCountProduct,
                       placeholder: "0,00000",
                       bgColor: .black.opacity(0.5),
                       isDisabled: true)
            ProductPicker(selection: $viewModel.selectProduct,
                          products: viewModel.products)
            SmartButton(name: "Посчитать",
                        bgColor: .green,
                        foregroundColor: .white) { viewModel.convertCount() }
            SmartButton(name: "Запомнить",
                        bgColor: .yellow,
                        foregroundColor: .black) { viewModel.save() }
  
//            //слайдер, ползунок
//            Slider(value: $viewModel.sliderValue,
//                   in: 0...100,
//                   step: 1)
//            .blur(radius: 2)
//            
//            //прогрессбар
//            ProgressView(value: viewModel.sliderValue / 100)
            List(content: {
                ForEach(Array(viewModel.listProduct).sorted(by: { $0.product.title < $1.product.title })) { cell in
                    HStack {
                        HStack {
                            Image(cell.product.imageName).resizable() .scaledToFill().frame(width: 30, height: 30)
                            Text(cell.product.title).padding(.horizontal, 10)
                        }
                        Spacer()
                        Text(String(format: "%.2f", cell.amount))
                        Text(cell.unit.rawValue)
                    }
                    .listRowBackground(
                        RoundedRectangle(cornerRadius: 0)
                                .fill(.white.opacity(0.7))
                        )
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button("Удалить") {
                            viewModel.delete(at: cell.id)
                        }
                        .tint(.red)
                    }
                }
            })
            .listStyle(.plain)
        }
        .environmentObject(viewModel)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image("bg")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        )
        .onAppear {
            viewModel.getAllProducts()
            print(RealmService.shared.config.fileURL!)
        }
    }
}

#Preview {
    ConvertView(viewModel: ConvertViewModel())
}
