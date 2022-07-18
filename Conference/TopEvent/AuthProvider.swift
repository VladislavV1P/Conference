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
import CryptoKit
import AuthenticationServices

class AuthProvider: NSObject, UserAuthenticationRequirements{
    
    private enum Constants {
        static let arrayForRandomNonceString: String = "0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._"
        static let defaultRandomNonceString: String = ""
        static let minRemainingLengthString: Int = 0
        static let maxRemainingLengthString: Int = 16
        static let errorGenerateNonceString: String = "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus"
        static let hashStringFormat: String = "%02x"
        static let errorSerializeTokenString: String = "Unable to serialize token string from data:"
        static let providerID: String = "apple.com"
        static let errorAuthorizationAppleID: String = "Sign in with Apple errored:"
    }
  
    var view: UIViewController?
    fileprivate var currentNonce: String?
    
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
    
    func signAppleID() {
        let nonce = randomNonceString()
        currentNonce = nonce
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        request.nonce = sha256(nonce)
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
    func outAccount(){
        try? Auth.auth().signOut()
    }
}

extension AuthProvider {
    
    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > Constants.minRemainingLengthString)
        let charset: [Character] =
        Array(Constants.arrayForRandomNonceString)
        var result = Constants.defaultRandomNonceString
        var remainingLength = length
        
        while remainingLength > Constants.minRemainingLengthString {
            let randoms: [UInt8] = (Constants.minRemainingLengthString ..< Constants.maxRemainingLengthString).map { _ in
                var random: UInt8 = UInt8(Constants.minRemainingLengthString)
                let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                if errorCode != errSecSuccess {
                    debugPrint(
                        "\(Constants.errorGenerateNonceString) \(errorCode)"
                    )
                }
                return random
            }
            randoms.forEach { random in
                if random < charset.count ,
                   remainingLength > Constants.minRemainingLengthString {
                    result.append(charset[Int(random)])
                    remainingLength -= 1
                }
            }
        }
        
        return result
    }
    
    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            String(format: Constants.hashStringFormat, $0)
        }.joined()
        
        return hashString
    }
}

extension AuthProvider: ASAuthorizationControllerDelegate {
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        debugPrint("\(Constants.errorAuthorizationAppleID) \(error)")
    }
}

extension AuthProvider: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        guard let view = view?.view.window else {return UIWindow()}
        return view
    }
}
