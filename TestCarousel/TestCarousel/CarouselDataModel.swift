//
//  CarouselDataModel.swift
//  TestCarousel
//
//  Created by 안현주 on 2021/11/21.
//

import UIKit

struct CarouselDataModel {
    let ImageName: String

    func makeImage() -> UIImage? {
        return UIImage(named: ImageName)
    }
}
