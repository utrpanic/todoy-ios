import BoxKit
import Firebase
import GoogleSignIn

struct LoggedInEvent: LocalEvent { }
struct LoggedOutEvent: LocalEvent { }

final class AuthService: NSObject, GIDSignInDelegate {
    
    private let userDefaults: UserDefaultsProtocol
    var samIsLoggedIn: Bool {
        get { self.userDefaults.bool(forKey: "samIsLoggedIn") }
        set { self.userDefaults.set(newValue, forKey: "samIsLoggedIn")}
    }
    
    init(userDefaults: UserDefaultsProtocol) {
        self.userDefaults = userDefaults
    }
    
    func setupForApplication() {
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
    }
    
    func handleUrl(_ url: URL) {
        GIDSignIn.sharedInstance().handle(url)
    }
    
    func login(presenting viewController: UIViewController) {
        GIDSignIn.sharedInstance()?.presentingViewController = viewController
        GIDSignIn.sharedInstance().signIn()
    }
    
    func logout() {
        GIDSignIn.sharedInstance().disconnect()
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            return
        }
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(
            withIDToken: authentication.idToken,
            accessToken: authentication.accessToken
        )
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                
            } else {
                print(authResult?.user.displayName)
                self.samIsLoggedIn = true
                LoggedInEvent().notify()
            }
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        self.samIsLoggedIn = false
        LoggedOutEvent().notify()
    }
}
