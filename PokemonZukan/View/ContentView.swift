import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                pageController
                Divider()
                
                TabView(selection: $viewModel.selection) {
                    ForEach(viewModel.pages, id: \.self) { page in
                        PageView(viewModel: .init(page: page))
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            .navigationTitle("pokemon")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    var pageController: some View {
            HStack {
                Spacer()
                Button {
                    withAnimation {
                        viewModel.prevPage()
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title3).bold()
                }
                .disabled(viewModel.prevButtonDisabled)
                Spacer()
                Text(viewModel.currentPageLabel)
                    .font(.title3)
                    .frame(width: 100)
                Spacer()
                Button {
                    withAnimation {
                        viewModel.nextPage()
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title3).bold()
                }
                .disabled(viewModel.nextButtonDisabled)
                Spacer()
            }
            .padding(.vertical, 10)
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: .init())
    }
}
