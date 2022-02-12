//
//  SecondVC.swift
//  Data_Delegate
//
//  Created by 안현주 on 2022/02/13.
//

import UIKit

//1. 데이터를 넘기는 함수 원형만 적고, 구현부는 FirstVC에서 진행
protocol SampleProtocol {
  func dataSend(data: String)
}

class SecondVC: UIViewController {

  @IBOutlet weak var dataTextField: UITextField!
  
  //2. SampleProtocol형의 delegate 프로퍼티 생성
  var delegate : SampleProtocol?
  
  override func viewDidLoad() {
        super.viewDidLoad()
    }
    
  @IBAction func dataSendBtnClicked(_ sender: Any) {
    //3. 버튼을 눌렀을 때, 선언한 delegate의 dataSend에 textField의 텍스트를 담아주세요!
    if let text = dataTextField.text{
      delegate?.dataSend(data: text)
    }
    
    //4. delegate 처리가 끝난 뒤에, navigation pop처리
    self.navigationController?.popViewController(animated: true)
  }
  
}
