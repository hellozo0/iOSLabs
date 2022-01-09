//
//  CarouselCVC.swift
//  TestCarousel
//
//  Created by 안현주 on 2021/11/21.
//

import UIKit

class CarouselCVC: UICollectionViewCell {

    static let identifier = "CarouselCVC"
    @IBOutlet weak var carouselImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(appData: CarouselDataModel){
        carouselImageView.image = appData.makeImage()
    }

}

//let customView: UIImageView = {
//       let view = UIImageView()
//       view.translatesAutoresizingMaskIntoConstraints = false
//       view.layer.cornerRadius = 2
//       view.clipsToBounds = true
//
//       return view
//   }()
//
//   override init(frame: CGRect) {
//       super.init(frame: frame)
//
//       self.addSubview(self.customView)
//
//       self.customView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//       self.customView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//       self.customView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
//       self.customView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1).isActive = true
//   }
//
//   required init?(coder aDecoder: NSCoder) {
//       fatalError("init(coder:) has not been implemented")
//   }
//}
