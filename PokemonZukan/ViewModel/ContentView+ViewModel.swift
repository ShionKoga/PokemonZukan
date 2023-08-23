import Combine
import Foundation

extension ContentView {
    class ViewModel: ObservableObject {
        @Published var selection: Int = 0 {
            didSet {
                currentPageLabel = "\((selection * 10) + 1) ~ \((selection + 1) * 10)"
                nextButtonDisabled = selection == 9
                prevButtonDisabled = selection == 0
            }
        }
        let pages = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        @Published var currentPageLabel: String = "1 ~ 10"
        @Published var nextButtonDisabled: Bool = false
        @Published var prevButtonDisabled: Bool = true
        
        
        func nextPage() {
            if selection < 9 {
                selection += 1
            }
        }
        
        func prevPage() {
            if selection > 0 {
                selection -= 1
            }
        }
    }
}
