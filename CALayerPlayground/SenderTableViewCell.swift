//
//  SenderTableViewCell.swift
//  CALayerPlayground
//
//  Created by Semen Matsepura on 04.02.16.
//  Copyright © 2016 Semen Matsepura. All rights reserved.
//

import UIKit

class SenderTableViewCell: BaseMessageTableViewCell {
    
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
        self.textMessage.anchorPoint = CGPoint(x: 0, y: 0.5)
        
        self.textMessage.backgroundColor = UIColor.darkGrayColor().CGColor
        self.textMessage.cornerRadius = 20
        self.textMessage.frame.size = calculateSizeOfBubleImage()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.textMessage.position = CGPoint(x: 10, y: self.bounds.height / 2)
    }
    
    private func calculateSizeOfBubleImage() -> CGSize{
        var size = CGSize()
        size = CGSizeMake(120, 40)
        return size
    }
}





