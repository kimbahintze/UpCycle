//
//  Common.swift
//  UpCycle
//
//  Created by Kimba Hintze on 6/21/18.
//  Copyright © 2018 Kim Lundquist. All rights reserved.
//

import UIKit

public let MontserratMedium = "Montserrat-Medium"
public let MontserratThin = "Montserrat-Thin"

let lighterGreen = UIColor(red: 35/255, green: 193/255, blue: 129/255, alpha: 1.0)
let darkerGreen = UIColor(red: 13/255, green: 155/255, blue: 121/255, alpha: 1.0)
let orangishColor = UIColor(red: 229/255, green: 99/255, blue: 83/255, alpha: 1.0)
let lightGrayColor = UIColor(red: 225/255, green: 230/255, blue: 233/255, alpha: 1.0)
let mediumGrayColor = UIColor(red: 213/255, green: 214/255, blue: 219/255, alpha: 1)
let darkGrayColor = UIColor(red: 100/255, green: 121/255, blue: 138/255, alpha: 1)

func logoTitleView() -> UIView {
    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    imageView.image = #imageLiteral(resourceName: "smallrotate ")
    imageView.contentMode = .scaleAspectFit
    return imageView
}


