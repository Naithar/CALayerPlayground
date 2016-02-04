//
//  BaseMessageTableViewCell.swift
//  CALayerPlayground
//
//  Created by Semen Matsepura on 04.02.16.
//  Copyright © 2016 Semen Matsepura. All rights reserved.
//

import UIKit

class BaseMessageTableViewCell: UITableViewCell {

    private(set) var textMessage: CALayer!
    
    
    class func messageLayerClass() -> CALayer.Type {
        return CALayer.self
    }
    
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
        self.textMessage = self.dynamicType.messageLayerClass().init()
        self.contentView.layer.addSublayer(self.textMessage)
        self.textMessage.masksToBounds = true
    }
}
