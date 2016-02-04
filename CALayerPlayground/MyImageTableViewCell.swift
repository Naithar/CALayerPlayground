//
//  MyImageTableViewCell.swift
//  CALayerPlayground
//
//  Created by Semen Matsepura on 04.02.16.
//  Copyright © 2016 Semen Matsepura. All rights reserved.
//

import UIKit

class MyImageTableViewCell: BaseMessageTableViewCell {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.commonInit()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.commonInit()
    }
    
    private func commonInit() {
        self.setupMessageLayer()
    }
    
    private func setupMessageLayer() {
        self.textMessage.anchorPoint = CGPoint(x: 1, y: 0.5)
        self.textMessage.contentsGravity = kCAGravityResizeAspect
        self.textMessage.backgroundColor = UIColor.lightGrayColor().CGColor
        self.textMessage.cornerRadius = 20
        self.textMessage.frame.size = calculateSizeOfBubbleImage()
        self.textMessage.contents = UIImage(named: "cat")?.CGImage
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.textMessage.position = CGPoint(x: self.bounds.width - 10, y: self.bounds.height / 2)
    }
    
    private func calculateSizeOfBubbleImage() -> CGSize {
        var size = CGSize()
        size = CGSizeMake(120, 120)
        return size
    }
}