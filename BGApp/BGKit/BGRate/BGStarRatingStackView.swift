//
//  BGStarRatingStackView.swift
//  BGSetup
//
//  Created by Basem Elgendy on 2/23/19.
//  Copyright © 2019 Basem Elgendy. All rights reserved.

import UIKit

class BGStarRatingStackView: UIStackView {
    
    
    @IBOutlet weak var star1ImageView: UIImageView!
    @IBOutlet weak var star2ImageView: UIImageView!
    @IBOutlet weak var star3ImageView: UIImageView!
    @IBOutlet weak var star4ImageView: UIImageView!
    @IBOutlet weak var star5ImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }



}
