//
//  UITableView+Extensions.swift
//  BGApp
//
//  Created by BasemElgendy on 11/08/2021.
//

import UIKit

extension UITableView {
    
    func setupEmpty(controller: UIViewController){
        self.emptyStateDataSource = controller
        self.emptyStateDelegate = controller
    }
}
