//
//  SenderTableViewCell.swift
//  CALayerPlayground
//
//  Created by Semen Matsepura on 04.02.16.
//  Copyright © 2016 Semen Matsepura. All rights reserved.
//

import UIKit

class SenderTableViewCell: BaseMessageTableViewCell {
    
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
        setupMessagesLayer()
    }
    
    private func setupMessagesLayer() {
        self.messageLayer.anchorPoint = CGPoint(x: 0, y: 0.5)
        
        self.messageLayer.backgroundColor = UIColor.darkGrayColor().CGColor
        self.messageLayer.cornerRadius = 20
        self.messageLayer.frame.size = calculateSizeOfBubleImage()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.messageLayer.position = CGPoint(x: 10, y: self.bounds.height / 2)
    }
    
    private func calculateSizeOfBubleImage() -> CGSize{
        var size = CGSize()
        size = CGSizeMake(120, 40)
        return size
    }
}





