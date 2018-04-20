//
//  PenView.swift
//  TearDrops
//
//  Created by Venkatesh Mandapati on 17/04/18.
//  Copyright © 2018 Venky. All rights reserved.
//

import UIKit

@objc protocol PenviewDelegate {
    func didViewClosed()
}

class PenView: UIView {

    weak var delegate: PenviewDelegate?
    
    @IBOutlet weak var penDrawView: DrawLine!
    
    @IBAction func closeActiom(_ sender: Any) {
        delegate?.didViewClosed()   
        self.removeFromSuperview()
    }
    @IBAction func clearAction(_ sender: Any) {
        NotificationCenter.default.post(name:Notification.Name("pentoolUndo"), object: nil)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    class func instanceFromNib() -> PenView {
        return UINib(nibName: "PenView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! PenView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initiatePenView(){
        penDrawView.initialSetup()
    }

}
