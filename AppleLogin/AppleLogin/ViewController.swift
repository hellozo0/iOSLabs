//
//  ViewController.swift
//  AppleLogin
//
//  Created by 안현주 on 2022/01/05.
//

import UIKit
import AuthenticationServices

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func appleLoginClicked(_ sender: Any) {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
}

extension ViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return  self.view.window!
    }
}

extension ViewController: ASAuthorizationControllerDelegate {
    //Apple ID 연동 성공시
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
            //Apple ID
            case let appleIDCredential as ASAuthorizationAppleIDCredential :
            
                //계정 정보 가져오기
                let identityToken = appleIDCredential.identityToken
                let tokenString = String(data: identityToken!, encoding: .utf8)
            
                guard let successVC = self.storyboard?.instantiateViewController(withIdentifier: "SuccessVC") as? SuccessVC else {return}
            
                successVC.modalPresentationStyle = .fullScreen
                self.present(successVC, animated: true, completion: nil)
                
                print("SOCIAL TOKEN", tokenString)
            default:
                guard let failVC = self.storyboard?.instantiateViewController(withIdentifier: "FailVC") as? FailVC else {return}
            
                failVC.modalPresentationStyle = .fullScreen
                self.present(failVC, animated: true, completion: nil)
            
                break
        }
    }
}

