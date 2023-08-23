import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            pageController
            
            TabView(selection: $viewModel.selection) {
                ForEach(viewModel.pages, id: \.self) { page in
                    PageView(viewModel: .init(page: page))
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    }
    
    var pageController: some View {
        HStack {
            Button {
                withAnimation {
                    viewModel.prevPage()
                }
            } label: {
                Text("<")
                    .font(.largeTitle)
            }
            .disabled(viewModel.prevButtonDisabled)
            
            Spacer()
            
            Text(viewModel.currentPageLabel)
                .font(.largeTitle)
            
            Spacer()
            
            Button {
                withAnimation {
                    viewModel.nextPage()
                }
            } label: {
                Text(">")
                    .font(.largeTitle)
            }
            .disabled(viewModel.nextButtonDisabled)
        }
        .padding(.horizontal, 10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: .init())
    }
}
