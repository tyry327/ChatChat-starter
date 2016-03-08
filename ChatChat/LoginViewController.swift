import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    // MARK: Properties
    var ref: Firebase!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Firebase(url: "https://tyrychatapp.firebaseio.com")
    }
    
    @IBAction func loginDidTouch(sender: AnyObject) {
        ref.authAnonymouslyWithCompletionBlock { (error, authData) in
            if error != nil { print(error.description); return }
            self.performSegueWithIdentifier("LoginToChat", sender: nil)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        let navVc = segue.destinationViewController as! UINavigationController
        let chatVc = navVc.viewControllers.first as! ChatViewController
        chatVc.senderId = ref.authData.uid
        chatVc.senderDisplayName = ""
    }
    
}

 