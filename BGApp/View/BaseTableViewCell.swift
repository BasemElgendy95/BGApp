//
//  BaseTableViewCell.swift
//  BGApp
//
//  Created by BasemElgendy on 11/08/2021.
//

import UIKit
import SDWebImage
class BaseTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellDetails: UILabel!

    func setupCell(cellData : CountryModel){
        cellTitle.text = EasyLocalization.getLanguage() == .ar ? cellData.nameAr ?? "" : cellData.nameEn ?? ""
        cellDetails.text = cellData.code ?? ""
        guard let imageURL = URL(string: cellData.image ?? "") else {return}
        cellImageView.sd_setImage(with: imageURL, placeholderImage: R.image.no_data_found())
    }
}
