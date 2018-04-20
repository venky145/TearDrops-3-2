//
//  NT_FirstViewController.swift
//  TearDrops
//
//  Created by Venkatesh Mandapati on 13/04/18.
//  Copyright © 2018 Venky. All rights reserved.
//

import UIKit
import AVKit
class NT_FirstViewController: UIViewController,PenviewDelegate {
let playerController = AVPlayerViewController()
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view6: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action:#selector(moveToPrevious(gestureRecg:)) )
        rightSwipe.direction = .right
        self.view.addGestureRecognizer(rightSwipe)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(moveToNext(gestureRecg:)))
        leftSwipe.direction = .left
        self.view.addGestureRecognizer(leftSwipe)
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        googleAnalyticsTrackingWith(trackingName: "Normo Tears Moderate & Severe Dry Eyes")
        
        if normovid == 0{
            playVideo(videoUrl:"Normo_Tears_in")
            normovid = 1
        }else {
            self.playerController.dismiss(animated: true)
        }
        
        view1.alpha = 1
        view2.alpha = 1
        view3.alpha = 1
        view4.alpha = 1
        view5.alpha = 1
        view6.alpha = 1
        
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
                                
                            }
                        }
                    }
                }
            }
        }
    }

    @objc func moveToNext(gestureRecg:UISwipeGestureRecognizer){
        let newViewController = setupStoryBoard(storyBoardName: "NormoTears").instantiateViewController(withIdentifier: "NT_SecondViewController") as! NT_SecondViewController
        moveToViewController(nextVC: newViewController,for: self)
    }
    @objc func moveToPrevious(gestureRecg:UISwipeGestureRecognizer){
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func videopop(_ sender: UIButton) {
        
        googleAnalyticsTrackingWith(trackingName: "Event Tracking \nCategory: Normo Tears \nAction: Video \nLabel: Normo Tears Drug Release")
        
        playVideo(videoUrl:"Normo_Tears_in")
    }
//    func playVideo2(videoUrl:String){
//        guard let path = Bundle.main.path(forResource: videoUrl, ofType:"mp4") else {
//            debugPrint("video.m4v not found")
//            return
//        }
//        let player = AVPlayer(url: URL(fileURLWithPath: path))
//        playerController.player = player
//        playerController.showsPlaybackControls = true
//        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerController.player?.currentItem)
//        present(playerController, animated: true) {
//            player.play()
//        }
//    }
    
    func playVideo(videoUrl:String){
        guard let path = Bundle.main.path(forResource: videoUrl, ofType:"mp4") else {
            debugPrint("video.m4v not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        playerController.player = player
        playerController.showsPlaybackControls = true
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerController.player?.currentItem)
        present(playerController, animated: true) {
            player.play()
        }
    }
    @objc func playerDidFinishPlaying(note: NSNotification) {
        
        self.playerController.dismiss(animated: true)
       
    }
    
    @IBAction func firstAction(_ sender: UIButton) {
    }
    @IBAction func secondAction(_ sender: UIButton) {
        let newViewController = setupStoryBoard(storyBoardName: "NormoTears").instantiateViewController(withIdentifier: "NT_SecondViewController") as! NT_SecondViewController
        moveToViewController(nextVC: newViewController,for: self)
    }
    
    
    @IBAction func thirdAction(_ sender: UIButton) {
        let newViewController = setupStoryBoard(storyBoardName: "NormoTears").instantiateViewController(withIdentifier: "NT_ThirdViewController") as! NT_ThirdViewController
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
        let popImage = UIImage(named: "normo_popup_new")
        let buttonImage = UIImage(named: "normo_close")
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
