/*Copyright (c) 2016, Andrew Walz.
 
 Redistribution and use in source and binary forms, with or without modification,are permitted provided that the following conditions are met:
 
 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 
 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the
 documentation and/or other materials provided with the distribution.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS
 BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
 GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. */

import UIKit


class SwiftyRecordButton: SwiftyCamButton {
    
    private var circleBorder: CALayer!
    private var innerCircle: CALayer!
    private var RecordCircle: UIView!
    
    let outerBorderWidth:CGFloat = 5
    let spaceInterCircle:CGFloat = 1
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        drawButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        drawButton()
    }
    
    private func drawButton() {
        self.backgroundColor = UIColor.clear
        circleBorder = CALayer()
        circleBorder.backgroundColor = UIColor.clear.cgColor
        circleBorder.borderWidth = outerBorderWidth
        circleBorder.borderColor = UIColor.white.cgColor
        circleBorder.bounds = self.bounds
        circleBorder.position = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        circleBorder.cornerRadius = self.frame.size.width / 2
        layer.insertSublayer(circleBorder, at: 0)
        
        innerCircle = CALayer()
        innerCircle.backgroundColor = circleBorder.borderColor
        innerCircle.borderColor = UIColor.clear.cgColor
        let inset = outerBorderWidth + spaceInterCircle
        innerCircle.bounds = circleBorder.bounds.insetBy(dx: inset, dy: inset)
        innerCircle.cornerRadius = innerCircle.frame.size.width / 2
        innerCircle.position = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        layer.insertSublayer(innerCircle, at: 0)
    }
    
    
    override var isHighlighted: Bool {
        set {
            if newValue {
                tapAnimation()
            }
            super.isHighlighted = newValue
        }
        get {
            return super.isHighlighted
        }
    }
    
    public func tapAnimation() {
        let animation = CAKeyframeAnimation(keyPath: "transform.scale")
        animation.values = [1.0, 0.9, 1.0]
        animation.keyTimes = [0.0, 0.5, 1.0]
        animation.duration = 0.3
        animation.timingFunctions = [CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut), CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)]
        innerCircle.add(animation, forKey: nil)
    }
    
    public func growButton() {
        if #available(iOS 10.0, *) {
            let aa = UIFeedbackGenerator.init()
            aa.prepare()
        } else {
            // Fallback on earlier versions
        }
//        RecordCircle = UIView(frame: CGRect(x: 0, y: 0, width: 1, height: 1))
//        RecordCircle.center = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
//        RecordCircle.backgroundColor = UIColor.red
//        RecordCircle.layer.cornerRadius = RecordCircle.frame.size.width / 2
//        RecordCircle.clipsToBounds = true
//        self.addSubview(RecordCircle)
//
//        UIView.animate(withDuration: 0.6, delay: 0.0, options: .curveEaseOut, animations: {
//            self.RecordCircle.transform = CGAffineTransform(scaleX: 62.4, y: 62.4)
//            self.circleBorder.setAffineTransform(CGAffineTransform(scaleX: 1.352, y: 1.352))
//            self.circleBorder.borderWidth = (6 / 1.352)
//
//        }, completion: { finish in
//            self.shrinkButton()
//        })
    }
    
    public func shrinkButton() {
//        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut, animations: {
//            self.RecordCircle.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
//            self.circleBorder.setAffineTransform(CGAffineTransform(scaleX: 1.0, y: 1.0))
//            self.circleBorder.borderWidth = 6.0
//        }, completion: { (success) in
//            self.RecordCircle.removeFromSuperview()
//            self.RecordCircle = nil
//        })
    }
}
