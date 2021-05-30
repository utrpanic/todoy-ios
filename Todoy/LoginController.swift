import SwiftUI

import GoogleSignIn

final class LoginController: UIHostingController<LoginView>, LoginViewListener {
    
    override init(rootView: LoginView) {
        super.init(rootView: rootView)
        self.rootView.listener = self
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loginButtonTapped() {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()
    }
}
