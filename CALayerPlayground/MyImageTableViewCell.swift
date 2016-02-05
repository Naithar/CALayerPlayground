//
//  MyImageTableViewCell.swift
//  CALayerPlayground
//
//  Created by Semen Matsepura on 04.02.16.
//  Copyright © 2016 Semen Matsepura. All rights reserved.
//

import UIKit

class MyImageTableViewCell: BaseMessageTableViewCell {
    
    let bubbleRightCapInsets: UIEdgeInsets = UIEdgeInsetsMake(15, 20, 15, 20)
    let mask = CALayer()
    let testImageView: UIImageView = UIImageView()
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
        self.messageLayer.contentsGravity = kCAGravityResizeAspectFill
        self.messageLayer.backgroundColor = UIColor.lightGrayColor().CGColor
        self.messageLayer.cornerRadius = 20
        self.messageLayer.frame.size = calculateSizeOfBubbleImage()
        
        self.testImageView.image = UIImage(named: "cat")
        self.testImage = UIImage(named: "rightBubbleBackground")!.resizableImageWithCapInsets(bubbleRightCapInsets, resizingMode:.Stretch)
        
        
        self.testImageView.frame = self.messageLayer.frame
        
//        self.textMessage.contents = UIImage(named: "cat")?.resizableImageWithCapInsets(bubbleRightCapInsets, resizingMode:.Stretch).CGImage
        self.mask.contents = testImage.CGImage
//
//      
        mask.frame = self.testImageView.layer.frame
        mask.contentsCenter =
            CGRectMake(bubbleRightCapInsets.left/testImage.size.width,
                bubbleRightCapInsets.top/testImage.size.height,
                1.0/testImage.size.width,
                1.0/testImage.size.height)
        self.testImageView.layer.mask = mask
        self.testImageView.layer.masksToBounds = true
        
        self.messageLayer.contents = testImageView.image?.CGImage
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.messageLayer.position = CGPoint(x: self.bounds.width - 10, y: self.bounds.height / 2)
    }
    
    private func calculateSizeOfBubbleImage() -> CGSize {
        var size = CGSize()
        size = CGSizeMake(120, 120)
        return size
    }
}