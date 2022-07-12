//
//  AuthProvider.swift
//  TopEvent
//
//  Created by Владислав Патраков on 10.06.2022.
//

import Foundation
import FirebaseAuth
import GoogleSignIn
import FirebaseCore

class AuthProvider: UserAuthenticationRequirements{
  
    var view: UIViewController?
    
    func signGoogle() {
        guard let currentView = view,
              let clientID = FirebaseApp.app()?.options.clientID else {return}
        let config = GIDConfiguration(clientID: clientID)
        
        GIDSignIn.sharedInstance.signIn(with: config, presenting: currentView) { [weak self] user, error in
            guard let self = self else {return}
            if let error = error {
                debugPrint(error)
                return
            }
            
            guard
                let authentication = user?.authentication,
                let idToken = authentication.idToken
            else {
                return
            }
            
            let credential = GoogleAuthProvider.credential(
                withIDToken: idToken,
                accessToken: authentication.accessToken)
            
            self.linkGoogleAccount(credential: credential, view: currentView)
        }
    }
    
    private func linkGoogleAccount(credential: AuthCredential, view: UIViewController){
        Auth.auth().signIn(with: credential) { authResult, error in
            guard error == nil else { return view.displayError(error) }
        }
    }
    
    func outAccount(){
        try? Auth.auth().signOut()
    }
}
