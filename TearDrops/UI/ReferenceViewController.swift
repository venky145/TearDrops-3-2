//
//  ReferenceViewController.swift
//  TearDrops
//
//  Created by Venkatesh Mandapati on 16/04/18.
//  Copyright © 2018 Venky. All rights reserved.
//

import UIKit

class ReferenceViewController: UIViewController {

    var getRefImage = UIImage()
    var getButtonImage = UIImage()
    @IBOutlet weak var referenceImage: UIImageView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var conReferenceImageAbv: NSLayoutConstraint!
    @IBOutlet weak var conReferanceImageRight: NSLayoutConstraint!
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: false) {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        closeButton.setImage(getButtonImage, for: .normal)
        referenceImage.image = getRefImage
        updateFrame()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func updateFrame() {
        let ivRatio = referenceImage.frame.size.height / referenceImage.frame.size.width
        let imgRatio = CGFloat((referenceImage.image?.size.height)!) / CGFloat((referenceImage.image?.size.width)!)
        
        let fixHeight = ivRatio < imgRatio
        
        var imageHeight:CGFloat!
        var imageWidth:CGFloat!
        
        if fixHeight {
            imageHeight = referenceImage.frame.size.height
            imageWidth = imageHeight / imgRatio
        } else {
            imageWidth = referenceImage.frame.size.width
            imageHeight = imageWidth * imgRatio
        }
        
        let top = (referenceImage.frame.size.height - imageHeight) / 2 - 25
        let right = ( imageWidth - referenceImage.frame.size.width) / 2 + 25
        conReferenceImageAbv.constant = top
        conReferanceImageRight.constant = right
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
