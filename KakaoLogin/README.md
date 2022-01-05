# BeMyPlan-iOS-Factory
비마플 아요 실험실




##  1 ) 소셜 로그인 예제

1. 카카오 로그인하기

  
다음과 같은 라이브러리를 세팅해줍니다!
pod 'KakaoSDKAuth'  # 카카오 로그인

pod 'KakaoSDKUser'  # 사용자 관리

  


  

  

[https://developers.kakao.com/console/app](https://developers.kakao.com/console/app)


  <img width="632" alt="스크린샷 2022-01-05 오후 1 00 35" src="https://user-images.githubusercontent.com/60260284/148158701-aaa5d2c8-e252-468e-99df-648b41c44524.png">

여기서 앱 생성하기

앱이름과 사업자명은 나중에 변경가능하니 일단 진행!

  

플랫폼 >> iOS 플랫폼 등록하기

  

Bundle ID (엑코 플젝 나와있는 값) 맞게 넣어주기.

  

여기서 값 불일치 시 로그인 정상동작 X
bundle ID값 확실히 체크!!

<img width="641" alt="스크린샷 2022-01-05 오후 1 01 06" src="https://user-images.githubusercontent.com/60260284/148158738-b0c80bc3-f431-4d70-ba5e-5b43ba365991.png">




여기서 네이티브 앱 키 미리 복사해두기

  
<img width="633" alt="스크린샷 2022-01-05 오후 1 01 28" src="https://user-images.githubusercontent.com/60260284/148158766-1b039fe8-5e80-4299-95be-afd87ef43b4b.png">

  

제품설정 >> 카카오 로그인 >> 상태 ON 으로 설정해두기

  

  

  
이제 엑스코드로 돌아가서!!


 
Appdelegate.swift 파일 들어가서


<img width="638" alt="스크린샷 2022-01-05 오후 1 02 20" src="https://user-images.githubusercontent.com/60260284/148158815-9adec4d2-3751-4168-8620-71a9575afa04.png">

import KakaoSDKCommon 후,

didFinishLaunch 메서드에서

    KakaoSDK.initSDK(appkey : 아까 봤던 네이티브 키 값 넣어두기)


  

  

SceneDelegate 파일 들어가서

  <img width="640" alt="스크린샷 2022-01-05 오후 1 02 53" src="https://user-images.githubusercontent.com/60260284/148158861-e7ef56a7-8ad3-4acf-a110-7ef80864e90d.png">


import kakoSDKAuth 후에

다음과 같이 카카오 login url

콜백 처리 메서드 달아두기

  

이후에 -> 웹에서 카카오톡 로그인 처리를 위해 진행하는 부분이에요!


``` Swift
  func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
    if let url = URLContexts.first?.url {
      if (AuthApi.isKakaoTalkLoginUrl(url)) {
        _ = AuthController.handleOpenUrl(url: url)
      }
    }
  }

```


  

  이후에,
  

info.plist 파일을 들어가서 
에서 LSApplicationQueriesSchemes 에서

kakaokompassauth 를 달아줘야 카카오톡 앱 호출 가능
하니까 요것도 처리!!

<img width="646" alt="스크린샷 2022-01-05 오후 1 03 52" src="https://user-images.githubusercontent.com/60260284/148158955-cde8663f-f67f-48ea-a5cd-b288666c3694.png">




  

  

Targets >> Info >> URL Types에다가

URL 스키마에다가

`kakao + “아까 받은 네이티브 키값”` 넣어주기

  <img width="633" alt="스크린샷 2022-01-05 오후 1 04 01" src="https://user-images.githubusercontent.com/60260284/148158961-3e12fc8f-a8e5-4e10-8ffd-bf8c55bcc257.png">


  

  

로그인 진행할 곳에서 다음과 같이 진행하면 끝!

  

<img width="635" alt="스크린샷 2022-01-05 오후 1 04 44" src="https://user-images.githubusercontent.com/60260284/148159004-5e98f7de-75be-4665-a828-b553154063c9.png">
  

  

  

  

애플 로그인



<img width="650" alt="스크린샷 2022-01-05 오후 1 05 09" src="https://user-images.githubusercontent.com/60260284/148159032-bfa2b42c-0f14-44a5-9975-cc5515e98378.png">

signing & Capabilities에서

  

+ Capability를 눌러서

Sign in with Apple 추가

이후에 

    import AuthenticationServices

한 이후에 
다음과 같이 로그인 처리하면 - 
토큰값 가져올 수 있습니다.

다음 토큰 값 가지고 로그인 처리 진행!

<img width="1169" alt="스크린샷 2022-01-05 오후 1 05 45" src="https://user-images.githubusercontent.com/60260284/148159066-7c5e55fc-7c98-4f99-a6ad-6d92f0eaf6ca.png">



자세한 로그인 처리 코드는 Login - Example 폴더에서 ViewController 파일 참고!!
