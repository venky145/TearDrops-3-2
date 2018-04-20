//
//  GTears_SecondViewController.swift
//  TearDrops
//
//  Created by Venkatesh Mandapati on 13/04/18.
//  Copyright © 2018 Venky. All rights reserved.
//

import UIKit

class GTears_SecondViewController: UIViewController,PenviewDelegate {
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view6: UIView!
    @IBOutlet weak var view7: UIView!
    @IBOutlet weak var view8: UIView!
    @IBOutlet weak var view9: UIView!
    @IBOutlet weak var view10: UIView!
    @IBOutlet weak var view11: UIView!
    @IBOutlet weak var view12: UIView!
    @IBOutlet weak var view13: UIView!
    
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
        
        googleAnalyticsTrackingWith(trackingName: "Glytears Chronic Dry Eyes Glycerin & CMC")
        
        view1.alpha = 1
        view2.alpha = 1
        view3.alpha = 1
        view4.alpha = 1
        view5.alpha = 1
        view6.alpha = 1
        view7.alpha = 1
        view8.alpha = 1
        view9.alpha = 1
        view10.alpha = 1
        view11.alpha = 1
        view12.alpha = 1
        view13.alpha = 1
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(animateViews), userInfo: nil, repeats: false)
    }
    
    @objc func animateViews() {
        UIView.animate(withDuration: 0.7, delay: 0.1, options: .curveEaseIn, animations: {
            self.view1.alpha = 0
        }) { (finished:Bool) in
            UIView.animate(withDuration: 0.7, delay: 0.1, options: .curveEaseIn, animations: {
                self.view2.alpha = 0
            }) { (finished:Bool) in
                UIView.animate(withDuration: 0.7, delay: 0.1, options: .curveEaseIn, animations: {
                    self.view3.alpha = 0
                }) { (finished:Bool) in
                    UIView.animate(withDuration: 0.7, delay: 0.1, options: .curveEaseIn, animations: {
                        self.view4.alpha = 0
                    }) { (finished:Bool) in
                        UIView.animate(withDuration: 0.7, delay: 0.1, options: .curveEaseIn, animations: {
                            self.view5.alpha = 0
                        }) { (finished:Bool) in
                            UIView.animate(withDuration: 0.7, delay: 0.1, options: .curveEaseIn, animations: {
                                self.view6.alpha = 0
                            }) { (finished:Bool) in
                                UIView.animate(withDuration: 0.7, delay: 0.1, options: .curveEaseIn, animations: {
                                    self.view7.alpha = 0
                                }) { (finished:Bool) in
                                    UIView.animate(withDuration: 0.7, delay: 0.1, options: .curveEaseIn, animations: {
                                        self.view8.alpha = 0
                                    }) { (finished:Bool) in
                                        UIView.animate(withDuration: 0.7, delay: 0.1, options: .curveEaseIn, animations: {
                                            self.view9.alpha = 0
                                        }) { (finished:Bool) in
                                            UIView.animate(withDuration: 0.7, delay: 0.1, options: .curveEaseIn, animations: {
                                                self.view10.alpha = 0
                                            }) { (finished:Bool) in
                                                UIView.animate(withDuration: 0.7, delay: 0.1, options: .curveEaseIn, animations: {
                                                    self.view11.alpha = 0
                                                }) { (finished:Bool) in
                                                    UIView.animate(withDuration: 0.7, delay: 0.1, options: .curveEaseIn, animations: {
                                                        self.view12.alpha = 0
                                                    }) { (finished:Bool) in
                                                        UIView.animate(withDuration: 0.7, delay: 0.1, options: .curveEaseIn, animations: {
                                                            self.view13.alpha = 0
                                                        }) { (finished:Bool) in
                                                            
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
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
        let newViewController = setupStoryBoard(storyBoardName: "GlyTears").instantiateViewController(withIdentifier: "GTears_ThirdViewController") as! GTears_ThirdViewController
        moveToViewController(nextVC: newViewController,for: self)
    }
    func moveToPrevious(){
        moveToPreviousViewController(currentVC: self, at: 1)
    }
    
    @IBAction func firstAction(_ sender: UIButton) {
        moveToPrevious()
    }
    @IBAction func secondAction(_ sender: UIButton) {
        moveToNextViewController()
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
        let popImage = UIImage(named: "gly_popup_new")
        let buttonImage = UIImage(named: "gly_close")
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
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}
