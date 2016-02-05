//
//  MessageLayer.swift
//  CALayerPlayground
//
//  Created by Sergey Minakov on 06.02.16.
//  Copyright © 2016 Semen Matsepura. All rights reserved.
//

import UIKit

class MessageLayer: CALayer {

    private(set) var contentLayer: CALayer!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.commonInit()
    }
    
    override init(layer: AnyObject) {
        super.init(layer: layer)
        
        self.commonInit()
    }
    
    required override init() {
        super.init()
        
        self.commonInit()
    }
    
    
    private func commonInit() {
        self.contentLayer = CALayer()
        self.addSublayer(self.contentLayer)
        
        self.shadowColor = UIColor.redColor().CGColor;
        self.shadowRadius = 5
        self.shadowOffset = CGSizeMake(2, 2);
        self.shadowOpacity = 1;
    }
    
    override func layoutSublayers() {
        super.layoutSublayers()
        
        self.contentLayer.frame = self.bounds
    }
    
    
}
