//
//  TD_FourthPageViewController.swift
//  TearDrops
//
//  Created by Venkatesh Mandapati on 10/04/18.
//  Copyright © 2018 Venky. All rights reserved.
//

import UIKit

class TD_FourthPageViewController: UIViewController,PenviewDelegate {
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var content: UIImageView!
    
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
        let popImage = UIImage(named: "td_popup_new")
        let buttonImage = UIImage(named: "td_close")
        presentReferenceView(currentVC: self, image: popImage!, with: buttonImage!)
    }
    
    func disbaleAllGestures(status:Bool){
        for recognizer in self.view.gestureRecognizers!{
            recognizer.isEnabled = status
        }
    }
    
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
        
        googleAnalyticsTrackingWith(trackingName: "Tear Drops Computer Vision Syndrome Incidence")
        
        self.content.alpha = 0
        
        let rect : CGRect = CGRect.init(x: self.view.center.x, y: 113, width: 0, height: 0)
        let prevRect = self.logo.frame
        self.logo.frame = rect
        UIView.animate(withDuration: 1, delay: 0.2, options: .curveEaseIn, animations: {
            self.logo.frame = prevRect
        }) { (finished:Bool) in
            UIView.animate(withDuration: 0.7, delay: 0.1, options: .curveEaseIn, animations: {
                self.content.alpha = 1
            }) { (finished:Bool) in
            
            }
        }
    }
    
    
    
    @objc func moveToNext(gestureRecg:UISwipeGestureRecognizer){
       moveToNextViewController()
    }
    
    @objc func moveToPrevious(gestureRecg:UISwipeGestureRecognizer){
        moveToPrevious()
    }
    
    func moveToNextViewController(){
        let newViewController = getStoryboard().instantiateViewController(withIdentifier: "TD_FifthPageViewController") as! TD_FifthPageViewController
        moveToViewController(nextVC: newViewController,for: self)
    }
    
    func moveToPrevious(){
        let newViewController = getStoryboard().instantiateViewController(withIdentifier: "TD_ThirdPageViewController") as! TD_ThirdPageViewController
        moveToViewController(nextVC: newViewController,for: self)
    }

    @IBAction func firstAction(_ sender: UIButton) {
        //moveToPreviousViewController(currentVC: self, at: 2)
        let newViewController = getStoryboard().instantiateViewController(withIdentifier: "TD_FirstPageViewController") as! TD_FirstPageViewController
        moveToViewController(nextVC: newViewController,for: self)
    }
    @IBAction func secondAction(_ sender: UIButton) {
        let newViewController = getStoryboard().instantiateViewController(withIdentifier: "TD_SecondPageViewController") as! TD_SecondPageViewController
        moveToViewController(nextVC: newViewController,for: self)
    }
    
    @IBAction func thirdAction(_ sender: UIButton) {
        let newViewController = getStoryboard().instantiateViewController(withIdentifier: "TD_ThirdPageViewController") as! TD_ThirdPageViewController
        moveToViewController(nextVC: newViewController,for: self)
    }
    @IBAction func fourthAction(_ sender: UIButton) {
    }
    @IBAction func fifthAction(_ sender: UIButton) {
        moveToNextViewController()
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
