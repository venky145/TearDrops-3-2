//
//  BrimoPViewController.swift
//  TearDrops
//
//  Created by Venkatesh Mandapati on 15/04/18.
//  Copyright © 2018 Venky. All rights reserved.
//

import UIKit

class BrimoPViewController: UIViewController,PenviewDelegate {

   
    
    @IBOutlet weak var v1: UIView!
    @IBOutlet weak var v2: UIView!
    @IBOutlet weak var v3: UIView!
    @IBOutlet weak var v4: UIView!
    @IBOutlet weak var v5: UIView!
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
        googleAnalyticsTrackingWith(trackingName: "Brimosun P Open Angle Glaucoma & Ocular Hypertension")
        self.v1.alpha = 1
        self.v2.alpha = 1
        self.v3.alpha = 1
        self.v4.alpha = 1
        self.v5.alpha = 1
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.animateViews), userInfo: nil, repeats: false)
      
    }
    
    @objc func animateViews(){
        UIView.animate(withDuration: 1, delay: 0.5, options: .curveEaseIn, animations: {
            self.v1.alpha = 0
            
        }) { (finished:Bool) in
            UIView.animate(withDuration: 0.7, delay: 0.1, options: .curveEaseIn, animations: {
                self.v2.alpha = 0
                
            }) { (finished:Bool) in
                UIView.animate(withDuration: 0.7, delay: 0.1, options: .curveEaseIn, animations: {
                    self.v3.alpha = 0
                    
                }) { (finished:Bool) in
                    UIView.animate(withDuration: 0.7, delay: 0.1, options: .curveEaseIn, animations: {
                        self.v4.alpha = 0
                        
                    }) { (finished:Bool) in
                        UIView.animate(withDuration: 0.7, delay: 0.1, options: .curveEaseIn, animations: {
                            self.v5.alpha = 0
                            
                        })
                    }
                }
            }
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
        moveToHome(currentVC:self)
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
        let popImage = UIImage(named: "brp_popup_new")
        let buttonImage = UIImage(named: "brp_close")
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
