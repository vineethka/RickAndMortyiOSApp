//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Vineeth Aravindan on 2/4/23.
//

import UIKit

extension UIView {
    func addSubViews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
