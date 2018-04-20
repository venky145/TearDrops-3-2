//
//  NataViewController.swift
//  TearDrops
//
//  Created by Venkatesh Mandapati on 15/04/18.
//  Copyright © 2018 Venky. All rights reserved.
//

import UIKit

class NataViewController: UIViewController,PenviewDelegate {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var ivLogo: UIImageView!
    @IBOutlet weak var ivTitle: UIImageView!
    @IBOutlet weak var ivContentBG: UIImageView!
    @IBOutlet weak var ivContent1: UIImageView!
    @IBOutlet weak var ivContent2: UIImageView!
    @IBOutlet weak var ivContent3: UIImageView!
    @IBOutlet weak var ivContent4: UIImageView!
    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var ivDosage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action:#selector(moveToPrevious(gestureRecg:)) )
        rightSwipe.direction = .right
        self.view.addGestureRecognizer(rightSwipe)
        
                let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(moveToNext(gestureRecg:)))
                leftSwipe.direction = .left
                self.view.addGestureRecognizer(leftSwipe)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        let rect : CGRect = CGRect.init(x: self.view.center.x, y: 113, width: 0, height: 0)
        let prevRect = self.logoImage.frame
        self.logoImage.frame = rect
        
        //        ivLogo.alpha = 0
        ivTitle.alpha = 0
        ivContentBG.alpha = 0
        ivContent1.alpha = 0
        ivContent2.alpha = 0
        ivContent3.alpha = 0
        ivContent4.alpha = 0
        ivImage.alpha = 0
        ivDosage.alpha = 0
        
        UIView.animate(withDuration: 1, delay: 0.5, options: .curveEaseIn, animations: {
            self.logoImage.frame = prevRect
            
        }) { (finished:Bool) in
//            UIView.animate(withDuration: 0.7, delay: 0.1, options: .curveEaseIn, animations: {
//                self.ivLogo.alpha = 1
//            }) { (finished:Bool) in
                UIView.animate(withDuration: 0.7, delay: 0.1, options: .curveEaseIn, animations: {
                    self.ivTitle.alpha = 1
                }) { (finished:Bool) in
                    UIView.animate(withDuration: 0.4, delay: 0.1, options: .curveEaseIn, animations: {
                        self.ivContentBG.alpha = 1
                    }) { (finished:Bool) in
                        UIView.animate(withDuration: 0.2, delay: 0.1, options: .curveEaseIn, animations: {
                            self.ivContent1.alpha = 1
                        }) { (finished:Bool) in
                            UIView.animate(withDuration: 0.2, delay: 0.1, options: .curveEaseIn, animations: {
                                self.ivContent2.alpha = 1
                            }) { (finished:Bool) in
                                UIView.animate(withDuration: 0.2, delay: 0.1, options: .curveEaseIn, animations: {
                                    self.ivContent3.alpha = 1
                                }) { (finished:Bool) in
                                    UIView.animate(withDuration: 0.2, delay: 0.1, options: .curveEaseIn, animations: {
                                        self.ivContent4.alpha = 1
                                    }) { (finished:Bool) in
                                        UIView.animate(withDuration: 0.7, delay: 0.1, options: .curveEaseIn, animations: {
                                            self.ivImage.alpha = 1
                                        }) { (finished:Bool) in
                                            UIView.animate(withDuration: 0.7, delay: 0.1, options: .curveEaseIn, animations: {
                                                self.ivDosage.alpha = 1
                                            }) { (finished:Bool) in
                                                
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
//            }
        }
    }
    
        @objc func moveToNext(gestureRecg:UISwipeGestureRecognizer){
            if GlobalClass.shared.selectionArray.count > 1{
                GlobalClass.shared.selectionArray.remove(at: 0)
                let nextVC = GlobalClass.shared.selectionArray[0]
                moveToViewController(nextVC: nextVC,for: self)
            }
        }
    @objc func moveToPrevious(gestureRecg:UISwipeGestureRecognizer){
        moveToPreviousViewController(currentVC: self, at: 0)
    }
    
    @IBAction func homeAction(_ sender: Any) {
        moveToPreviousViewController(currentVC: self, at: 0)
    }
    @IBAction func editAction(_ sender: Any) {
        disbaleAllGestures(status: false)
        let penView = PenView.instanceFromNib()
        penView.initiatePenView()
        penView.delegate = self
        penView.frame = CGRect.init(x: 0, y: 68, width: self.view.bounds.width, height: self.view.bounds.height - 68)
        penView.backgroundColor = UIColor.clear
        self.view.addSubview(penView)
        
    }
    func didViewClosed(){
        disbaleAllGestures(status: true)
    }
    @IBAction func referenceAction(_ sender: Any) {
        let popImage = UIImage(named: "nat_popup_new")
        let buttonImage = UIImage(named: "nat_close")
        presentReferenceView(currentVC: self, image: popImage!, with: buttonImage!)
    }
    
    func disbaleAllGestures(status:Bool){
        for recognizer in self.view.gestureRecognizers!{
            recognizer.isEnabled = status
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
