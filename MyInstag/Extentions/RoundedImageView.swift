//
//  RoundedImageView.swift
//  MyInstag
//
//  Created by Mehmet Baykar on 15/09/2019.
//  Copyright © 2019 Mehmet Baykar. All rights reserved.
//

import UIKit

@IBDesignable class RoundedImageView: UIImageView {
    private var _round = false
    @IBInspectable var round: Bool {
        set {
            _round = newValue
            makeRound()
        }
        get {
            return self._round
        }
    }
    override internal var frame: CGRect {
        set {
            super.frame = newValue
            makeRound()
        }
        get {
            return super.frame
        }
        
    }
    
    private func makeRound() {
        if self.round == true {
            self.clipsToBounds = true
            self.layer.cornerRadius = (self.frame.width + self.frame.height) / 4
        } else {
            self.layer.cornerRadius = 0
        }
    }
    
    override func layoutSubviews() {
        makeRound()
    }
}
