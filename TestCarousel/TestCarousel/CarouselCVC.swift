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
