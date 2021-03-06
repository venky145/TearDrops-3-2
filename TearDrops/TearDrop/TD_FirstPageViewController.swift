//
//  TD_FirstPageViewController.swift
//  TearDrops
//
//  Created by Venkatesh Mandapati on 10/04/18.
//  Copyright © 2018 Venky. All rights reserved.
//

import UIKit
import AVKit

class TD_FirstPageViewController: UIViewController,AVPlayerViewControllerDelegate,PenviewDelegate {
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
    
    let playerController = AVPlayerViewController()
    
    @IBAction func firstAction(_ sender: UIButton) {
    }
    @IBAction func secondAction(_ sender: UIButton) {
//        performSegue(withIdentifier: "td_page2", sender: nil)
        let newViewController = getStoryboard().instantiateViewController(withIdentifier: "TD_SecondPageViewController") as! TD_SecondPageViewController
        moveToViewController(nextVC: newViewController,for: self)
    }
    @IBAction func thirdAction(_ sender: UIButton) {
        let newViewController = getStoryboard().instantiateViewController(withIdentifier: "TD_ThirdPageViewController") as! TD_ThirdPageViewController
        moveToViewController(nextVC: newViewController,for: self)
    }
    @IBAction func fourthAction(_ sender: UIButton) {
        let newViewController = getStoryboard().instantiateViewController(withIdentifier: "TD_FourthPageViewController") as! TD_FourthPageViewController
        moveToViewController(nextVC: newViewController,for: self)
    }
    @IBAction func fifthAction(_ sender: UIButton) {
        let newViewController = getStoryboard().instantiateViewController(withIdentifier: "TD_FifthPageViewController") as! TD_FifthPageViewController
        moveToViewController(nextVC: newViewController,for: self)
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
    
    func playVideo(){
        guard let path = Bundle.main.path(forResource: "3_TD_VA_Opener", ofType:"mp4") else {
            debugPrint("video.m4v not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        playerController.player = player
        playerController.delegate = self
        playerController.showsPlaybackControls = true
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerController.player?.currentItem)
        present(playerController, animated: true) {
            player.play()
        }
    }
    @objc func playerDidFinishPlaying(note: NSNotification) {
        self.playerController.dismiss(animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        googleAnalyticsTrackingWith(trackingName: "Tear Drops Dry Eye Incidence")
        
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
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(animateViews), userInfo: nil, repeats: false)
        
        if teardropvid == 0 {
            self.playVideo()
            teardropvid = 1
            
        }else {
            self.playerController.dismiss(animated: true)
        }
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

        let newViewController = getStoryboard().instantiateViewController(withIdentifier: "TD_SecondPageViewController") as! TD_SecondPageViewController
        moveToViewController(nextVC: newViewController,for: self)
    }
    @objc func moveToPrevious(gestureRecg:UISwipeGestureRecognizer){
        self.navigationController?.popViewController(animated: true)
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


//extension TD_FirstPageViewController{

    public func addTransition(animationType:String)-> CATransition{
        let transition = CATransition()
        transition.duration = 1
        transition.type = animationType
        transition.subtype = kCATransitionFromBottom
        return transition
    }
    public func dismissTransition(animationType:String)-> CATransition{
        let transition = CATransition()
        transition.duration = 1
        transition.type = animationType
        transition.subtype = kCATransitionFromLeft
        return transition
    }

    public func getStoryboard()->UIStoryboard{
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        return storyBoard
    }
    public func moveToViewController(nextVC:UIViewController,for currentVC:UIViewController){
        currentVC.navigationController?.view.layer.add(addTransition(animationType: "pageCurl"), forKey: kCATransition)
        currentVC.navigationController?.pushViewController(nextVC, animated: false)
    }
    public func moveToPreviousViewController(currentVC:UIViewController,at index:Int){
        currentVC.navigationController?.view.layer.add(dismissTransition(animationType: "pageCurl"), forKey: kCATransition)
//    currentVC.navigationController?.popToViewController((currentVC.navigationController?.viewControllers[index])!, animated: true)
        currentVC.navigationController?.popViewController(animated: true)
    }

    func moveToHome(currentVC:UIViewController){
        currentVC.navigationController?.view.layer.add(dismissTransition(animationType: "pageCurl"), forKey: kCATransition)
         currentVC.navigationController?.popToViewController((currentVC.navigationController?.viewControllers[0])!, animated: true)
    }

    public func googleAnalyticsTrackingWith(trackingName:String){
        guard let tracker = GAI.sharedInstance().defaultTracker else { return }
        tracker.set(kGAIScreenName, value: trackingName)
    
        guard let builder = GAIDictionaryBuilder.createScreenView() else { return }
        tracker.send(builder.build() as [NSObject : AnyObject])
    }

public func presentReferenceView(currentVC:UIViewController,image:UIImage,with closeButton:UIImage){

        let viewControllerToLoad = ReferenceViewController()
        viewControllerToLoad.getRefImage = image
        viewControllerToLoad.getButtonImage = closeButton
        viewControllerToLoad.providesPresentationContextTransitionStyle = true
        viewControllerToLoad.definesPresentationContext = true
        viewControllerToLoad.modalPresentationStyle = .overCurrentContext
        
        currentVC.present(viewControllerToLoad, animated: false) {
            
        }
    }

    
//}
