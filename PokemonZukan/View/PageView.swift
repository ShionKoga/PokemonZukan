import SwiftUI

struct PageView: View {
    let text: String
    
    init(text: String) {
        print("init\(text)")
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .font(.system(size: 450))
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(text: "1")
    }
}
