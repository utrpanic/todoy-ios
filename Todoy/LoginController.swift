import SwiftUI

import GoogleSignIn

final class LoginController: UIHostingController<LoginView>, LoginViewListener {
    
    var service: AuthService = AuthService(userDefaults: UserDefaults.todoy)
    
    override init(rootView: LoginView) {
        super.init(rootView: rootView)
        self.rootView.listener = self
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loginButtonTapped() {
        self.service.login(presenting: self)
    }
}
