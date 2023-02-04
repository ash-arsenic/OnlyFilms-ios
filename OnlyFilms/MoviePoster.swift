//
//  MoviePoster.swift
//  OnlyFilms
//
//  Created by Rapipay Macintoshn on 03/02/23.
//

import UIKit

class MoviePoster: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
//        addCornerRadius()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addCornerRadius()
    }
    
    func addCornerRadius() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 15
    }
}
