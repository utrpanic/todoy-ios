import SwiftUI

protocol LoginViewListener: AnyObject {
    func loginButtonTapped()
}

struct LoginView: View {
    
    weak var listener: LoginViewListener?
    
    var body: some View {
        return Button("Login") {
            self.listener?.loginButtonTapped()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    
    static var previews: some View {
        LoginView()
    }
}
