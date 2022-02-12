//
//  SecondVC.swift
//  Data_NotificationCenter
//
//  Created by 안현주 on 2022/02/13.
//

import UIKit

class SecondVC: UIViewController {

  @IBOutlet weak var notiTextField: UITextField!
  override func viewDidLoad() {
        super.viewDidLoad()

    }

  @IBAction func backBtnClicked(_ sender: Any) {
    NotificationCenter.default.post(name: NSNotification.Name("notiData"), object: notiTextField.text)
    
    self.navigationController?.popViewController(animated: true)
  }

}
