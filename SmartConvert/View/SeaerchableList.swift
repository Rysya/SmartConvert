//import SwiftUI
//
//struct SeaerchableList: View {
//    
//    let names: [String] = ["Вася", "Петя", "Коля", "Маша", "Анна"]
//    @State private var searchText: String = ""
//    
//    var searchResults: [String] {
//        guard !searchText.isEmpty else { return names }
//        return names.filter { $0.contains(searchText) }
//    }
//    
//    var body: some View {
//        NavigationView {
//            List{
//                ForEach(searchResults, id: \.self) { name in
//                    Text(name)
//                }
//            }
//            .searchable(text: $searchText)
//        }
//    }
//}
//
//struct SeaerchableList_Previews: PreviewProvider {
//    static var previews: some View {
//        SeaerchableList()
//    }
//}
