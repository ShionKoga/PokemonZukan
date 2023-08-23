@testable import PokemonZukan
import XCTest
import Combine

final class ContentViewModelTests: XCTestCase {
    var cancellables = Set<AnyCancellable>()

    func test_selectionの初期値として0をパブリッシュする() throws {
        let viewModel = ContentView.ViewModel()
        
        
        XCTAssertEqual(0, viewModel.selection)
    }
    
    func test_ページを次に送ることができる() {
        let viewModel = ContentView.ViewModel()
        
        
        viewModel.nextPage()
        
        
        XCTAssertEqual(1, viewModel.selection)
    }
    
    func test_ページを前に戻すことができる() {
        let viewModel = ContentView.ViewModel()
        
        
        viewModel.nextPage()
        viewModel.nextPage()
        viewModel.prevPage()
        
        
        XCTAssertEqual(1, viewModel.selection)
    }
    
    func test_selectionは9以上にならない() {
        let viewModel = ContentView.ViewModel()
        
        
        for _ in 1...10 {
            viewModel.nextPage()
        }
        
        
        XCTAssertEqual(9, viewModel.selection)
    }
    
    func test_selectionが9の時次に送るボタンを無効化する() {
        let viewModel = ContentView.ViewModel()
        
        
        XCTAssertFalse(viewModel.nextButtonDisabled)
        
        
        viewModel.selection = 9
        
        
        XCTAssertTrue(viewModel.nextButtonDisabled)
    }
    
    func test_selectionは0以下にならない() {
        let viewModel = ContentView.ViewModel()
        
        
        viewModel.prevPage()
        
        
        XCTAssertEqual(0, viewModel.selection)
    }
    
    func test_selectionが0のとき前に戻るボタンを無効化する() {
        let viewModel = ContentView.ViewModel()
        
        
        XCTAssertTrue(viewModel.prevButtonDisabled)
        
        
        viewModel.selection = 1
        
        
        XCTAssertFalse(viewModel.prevButtonDisabled)
    }
    
    func test_0から9のインデックスの配列を持っている() {
        let viewModel = ContentView.ViewModel()
        
        
        XCTAssertEqual([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], viewModel.pages)
    }
    
    func test_ページラベルに表示するテキストをパブリッシュする() {
        let viewModel = ContentView.ViewModel()
        
        
        XCTAssertEqual("1 ~ 10", viewModel.currentPageLabel)
        
        
        viewModel.nextPage()
        viewModel.nextPage()
        
        
        XCTAssertEqual("21 ~ 30", viewModel.currentPageLabel)
        
        
        viewModel.prevPage()
        
        
        XCTAssertEqual("11 ~ 20", viewModel.currentPageLabel)
    }
}
