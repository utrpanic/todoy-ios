import BoxKit
import Firebase
import GoogleSignIn

struct LoggedInEvent: LocalEvent { }
struct LoggedOutEvent: LocalEvent { }

final class AuthService: NSObject, GIDSignInDelegate {
    
    var samIsHere: Bool = false
    
    func setupForApplication() {
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
    }
    
    func handleUrl(_ url: URL) {
        GIDSignIn.sharedInstance().handle(url)
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
//        if let error = error {
//            return
//        }
//        guard let authentication = user.authentication else { return }
//        let credential = GoogleAuthProvider.credential(
//            withIDToken: authentication.idToken,
//            accessToken: authentication.accessToken
//        )
        self.samIsHere = true
        LoggedInEvent().notify()
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        LoggedOutEvent().notify()
    }
}
