import SwiftUI
import RealmSwift

@main
struct SmartConvertApp: App {
 
    init() {
        RealmService.seedDatabaseIfNeeded()
        }
    
    var body: some Scene {
        
        WindowGroup {
            ConvertView()
          //  SeaerchableList()
        }
    }
}
