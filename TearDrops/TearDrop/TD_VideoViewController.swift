//
//  TD_VideoViewController.swift
//  TearDrops
//
//  Created by Venkatesh Mandapati on 10/04/18.
//  Copyright © 2018 Venky. All rights reserved.
//

import UIKit
import AVKit


class TD_VideoViewController: UIViewController {

    var isFirstVideoStarted = false
    var isSecondVideoStarted = false
    let playerController = AVPlayerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(moveToPrevious(gestureRecg:)))
        rightSwipe.direction = .right
        self.view.addGestureRecognizer(rightSwipe)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(moveToNext(gestureRecg:)))
        leftSwipe.direction = .left
        self.view.addGestureRecognizer(leftSwipe)
        isFirstVideoStarted = true
        playVideo(videoUrl:"Division Opener")
        
        if isSequence{
            currentStackIndex += 1
        }
    }
    
    func playVideo(videoUrl:String){
        guard let path = Bundle.main.path(forResource: videoUrl, ofType:"mp4") else {
            debugPrint("video.m4v not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        playerController.player = player
        //        playerController.delegate = self
//        self.view.addSubview(playerController.view)
//        playerController.view.frame = self.view.bounds
        playerController.showsPlaybackControls = false
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerController.player?.currentItem)
        present(playerController, animated: true) {
            player.play()
        }
    }
    @objc func playerDidFinishPlaying(note: NSNotification) {
        
        if isFirstVideoStarted {
            self.playerController.dismiss(animated: true)
            if isSecondVideoStarted{
                performSegue(withIdentifier: "td_page1", sender: nil)
            }else{
                isSecondVideoStarted = true
                playVideo(videoUrl:"3_TD_VA_Opener")
            }
        }
//
    }
    
    func playSecondVideo(videoUrl:String){
        isSecondVideoStarted = true
        guard let path = Bundle.main.path(forResource: videoUrl, ofType:"mp4") else {
            debugPrint("video.m4v not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        playerController.player = player
    }
    override func viewWillAppear(_ animated: Bool) {
        
        if isFirstVideoStarted && isSecondVideoStarted{
            performSegue(withIdentifier: "td_page1", sender: nil)
        }
    }
    
    @objc func moveToNext(gestureRecg:UISwipeGestureRecognizer){
        performSegue(withIdentifier: "td_page1", sender: nil)
    }
    @objc func moveToPrevious(gestureRecg:UISwipeGestureRecognizer){
        if isSequence{
            currentStackIndex -= 1
        }
        self.navigationController?.popViewController(animated: true)
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
