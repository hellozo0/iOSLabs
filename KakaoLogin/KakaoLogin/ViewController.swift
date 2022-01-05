//
//  ViewController.swift
//  KakaoLogin
//
//  Created by 안현주 on 2022/01/05.
//

import UIKit
import AuthenticationServices


import KakaoSDKAuth
import KakaoSDKUser

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func kakaoLoginClicked(_ sender: Any) {
    
        if (UserApi.isKakaoTalkLoginAvailable()) {
            // 카카오톡 로그인. api 호출 결과를 클로저로 전달.
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    //예외처리 (로그인 취소)
                    print("로그인 실패")
                    
                    //실패해서 실패 VC로 이동
                    self.gotoFailVC()
                    
                }
                else {
                    if let accessToken = oauthToken?.accessToken {
                        
                        //토큰 가져오려면 다음과 같이 accessToken 사용
                        print("!!!!!!!!!!! SOCIAL TOKEN", accessToken)
                        
                        
                        // 유저 데이터 가져오려면 다음과 같이 UserAPI에서
                        // user 값 가져오기
                        UserApi.shared.me { (user,error) in
                            print("👀 User Data")
                            dump(error)
                        }
                        
                        //성공해서 성공 VC로 이동
                        self.gotoSuccessVC()
                        
                        
                        
                    }
                }
                
            }
        }
        else { // 카카오 계정으로 로그인
            print("카카오톡 설치 되지 않음")
      
            UserApi.shared.loginWithKakaoAccount { (oauthToken, error) in
                if let error = error {
                    print("ERR",error)
                    self.gotoFailVC()
                }
                else {
                    // 여기서도 위와 같이 로그인 처리해주면 됨.
                    print("loginWithKakaoTalk() success.")
                    self.gotoSuccessVC()
                    
                }
            }
        }
        
    }
    
    func gotoSuccessVC() {
        //성공해서 성공 VC로 이동
        guard let successVC = self.storyboard?.instantiateViewController(withIdentifier: "SuccessVC") as? SuccessVC else {return}
        
        successVC.modalPresentationStyle = .fullScreen
        self.present(successVC, animated: true, completion: nil)
    }
    
    func gotoFailVC() {
        guard let failVC = self.storyboard?.instantiateViewController(withIdentifier: "FailVC") as? FailVC else {return}
        
        failVC.modalPresentationStyle = .fullScreen
        self.present(failVC, animated: true, completion: nil)
    }
    
    
    
    
}

