//
//  SecondVC.swift
//  Data_Property
//
//  Created by 안현주 on 2022/02/12.
//

import UIKit

class SecondVC: UIViewController {
  
  @IBOutlet weak var dataLabel: UILabel!
  
  //이전화면에서 전달되는 값을 받기 위해 프로퍼티를 추가
  //IBOutlet 변수는 외부에서 값을 직접 대입할 수 없음, 외부에서 직접 참조할 수 없음
  //그래서 두번째 화면으로 값을 대입하기 위해 따로 값을 지정해 줘야함
  var message: String?
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setMessageInLabel()
  }
  
  func setMessageInLabel(){
    //옵셔널 바인딩으로 안전하게 값을 꺼낸 뒤 dataLabel의 text로 넣습니다
    if let msg = message {
      dataLabel.text = msg
      dataLabel.sizeToFit()
    }
  }
  
  @IBAction func touchUpToGoBack(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }
  
}
