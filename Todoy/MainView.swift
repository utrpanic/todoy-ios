import SwiftUI

protocol MainViewListener: AnyObject {
    func logoutButtonTapped()
}

struct MainView: View {
    
    weak var listener: MainViewListener?
    
    var body: some View {
        HStack {
            Text("Hello, world!")
            Button("Logout") {
                self.listener?.logoutButtonTapped()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    
    static var previews: some View {
        MainView()
    }
}
