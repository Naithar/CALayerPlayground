//
//  MyTableViewCell.swift
//  CALayerPlayground
//
//  Created by Semen Matsepura on 04.02.16.
//  Copyright © 2016 Semen Matsepura. All rights reserved.
//

import UIKit
import Foundation

class MyTableViewCell: BaseMessageTableViewCell {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.commonInit()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier id: String?) {
        super.init(style: style, reuseIdentifier: id)
        
        self.commonInit()
    }
    
    private func commonInit() {
        self.setupMessageLayer()
    }
    
    private func setupMessageLayer() {
        self.textMessage.anchorPoint = CGPoint(x: 1, y: 0.5)
        self.textMessage.backgroundColor = UIColor.lightGrayColor().CGColor
        self.textMessage.cornerRadius = 20
        self.textMessage.frame.size = self.calculateSizeOfBubbleImage()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.textMessage.position = CGPoint(x: self.bounds.width - 10, y: self.bounds.height / 2)
    }
    
    private func calculateSizeOfBubbleImage() -> CGSize {
        var size = CGSize()
        size = CGSizeMake(120, 40)
        return size
    }
}




