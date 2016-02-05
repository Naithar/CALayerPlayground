//
//  MyImageTableViewCell.swift
//  CALayerPlayground
//
//  Created by Semen Matsepura on 04.02.16.
//  Copyright © 2016 Semen Matsepura. All rights reserved.
//

import UIKit

class MyImageTableViewCell: BaseMessageTableViewCell {
    
    let bubbleRightCapInsets: UIEdgeInsets = UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 0)
    let mask = CALayer()
    var testImage: UIImage = UIImage()
    // MARK: Setup
    
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
        
        self.messageLayer.anchorPoint = CGPoint(x: 1, y: 0.5)
        self.messageLayer.contentLayer.contentsGravity = kCAGravityResizeAspectFill
        self.messageLayer.frame.size = calculateSizeOfBubbleImage()
        
        if let bubble = UIImage(named: "rightBubbleBackground") {
            self.mask.contentsScale = bubble.scale
            self.mask.contents = bubble.CGImage
            self.mask.contentsCenter = CGRect(x: bubbleRightCapInsets.left/bubble.size.width,
                y: bubbleRightCapInsets.top/bubble.size.height,
                width: 1/bubble.size.width,
                height: 1/bubble.size.height);
        }
        
        self.messageLayer.masksToBounds = false
        self.messageLayer.contentLayer.contents = UIImage(named: "cat")?.CGImage
        self.messageLayer.contentLayer.mask = self.mask
        self.messageLayer.contentLayer.masksToBounds = true
        

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.messageLayer.position = CGPoint(x: self.bounds.width - 10, y: self.bounds.height / 2)
        self.mask.frame = self.messageLayer.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.messageLayer.frame.size = CGSize(width: 150, height: 50)
    }
    
    private func calculateSizeOfBubbleImage() -> CGSize {
        var size = CGSize()
        size = CGSizeMake(120, 120)
        return size
    }
}