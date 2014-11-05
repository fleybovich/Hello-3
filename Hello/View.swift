//
//  View.swift
//  Hello
//
//  Created by Mark Meretzky on 10/21/14.
//  Copyright (c) 2014 Mark Meretzky. All rights reserved.
//

import UIKit

class View: UIView {
    var x: CGFloat = 0;
    var y: CGFloat = 0;
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)

		//Ask for a color that is not the default.
		//Must do it here: in drawRect would be too late.
		backgroundColor = UIColor.yellowColor();
	}

	// Only override drawRect: if you perform custom drawing.
	// An empty implementation adversely affects performance during animation.

    


    
	override func drawRect(rect: CGRect) {
		// Drawing code
		let s: String = "I WILL RE-APPEAR";
		let font: UIFont = UIFont.systemFontOfSize(32);
        let foregroundColor: UIColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5 + CGFloat(sin(x)) / 2);
        let attributes: [NSObject: AnyObject] = [
            NSFontAttributeName: font,
            NSForegroundColorAttributeName: foregroundColor,
        ];
        //let attributes: [NSObject: AnyObject] = [NSFontAttributeName: font]; //a dictionary
		let point: CGPoint = CGPointMake(x, y);
        if y < 720 {
            y = y + 1;
            x = x + 0.5;
        } else {
            y = 0;
            x = 0;
        }
            // var move = Move(xxx, yy);
            let t: dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, Int64(NSEC_PER_SEC) / 90);
            dispatch_after(t, dispatch_get_main_queue(), {self.setNeedsDisplay();});
            
		s.drawAtPoint(point, withAttributes: attributes);
	}

}

