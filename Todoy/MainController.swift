import SwiftUI

import GoogleSignIn

final class MainController: UIHostingController<MainView>, MainViewListener {
    
    var service: AuthService = AuthService(userDefaults: UserDefaults.todoy)
    
    override init(rootView: MainView) {
        super.init(rootView: rootView)
        self.rootView.listener = self
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func logoutButtonTapped() {
        self.service.logout()
    }
}
