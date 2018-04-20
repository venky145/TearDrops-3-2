//
//  MIL_FifthViewController.swift
//  TearDrops
//
//  Created by Venkatesh Mandapati on 14/04/18.
//  Copyright © 2018 Venky. All rights reserved.
//

import UIKit

class MIL_FifthViewController: UIViewController,PenviewDelegate {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var contentImage: UIImageView!
    
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
        googleAnalyticsTrackingWith(trackingName: "Milflox Pre & Post Surgical Prophylaxis First-line")
        self.contentImage.alpha = 0
        
        let rect : CGRect = CGRect.init(x: self.view.center.x, y: 113, width: 0, height: 0)
        let prevRect = self.logoImage.frame
        self.logoImage.frame = rect
        UIView.animate(withDuration: 1, delay: 0.2, options: .curveEaseIn, animations: {
            self.logoImage.frame = prevRect
        }) { (finished:Bool) in
            UIView.animate(withDuration: 0.7, delay: 0.1, options: .curveEaseIn, animations: {
                self.contentImage.alpha = 1
            }) { (finished:Bool) in
                
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
        moveToPrevious()
    }
    
//    func moveToNextViewController(){
//        let newViewController = setupStoryBoard(storyBoardName: "Megabrom").instantiateViewController(withIdentifier: "MG_SecondViewController") as! MG_SecondViewController
//        moveToViewController(nextVC: newViewController,for: self)
//    }
    func moveToPrevious(){
        moveToPreviousViewController(currentVC: self, at: 5)
    }
    
    @IBAction func firstAction(_ sender: UIButton) {
        moveToPreviousViewController(currentVC: self, at: 2)
    }
    @IBAction func secondAction(_ sender: UIButton) {
        moveToPreviousViewController(currentVC: self, at: 3)
    }
    @IBAction func thirdAction(_ sender: UIButton) {
        moveToPreviousViewController(currentVC: self, at: 4)
    }
    @IBAction func fourthAction(_ sender: UIButton) {
       moveToPrevious()
    }
    
    @IBAction func fifthAction(_ sender: UIButton) {
        
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
        let popImage = UIImage(named: "mil_popup_new")
        let buttonImage = UIImage(named: "mil_close")
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
