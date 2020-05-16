//
//  level1.swift
//  Demensia
//
//  Created by Soumik Mukherjee on 23/02/20.
//  Copyright © 2020 Soumik Mukherjee. All rights reserved.
//

import UIKit
import AVFoundation
import Foundation
class level1 : UIViewController,AVAudioPlayerDelegate{
    override func viewDidLoad() {
        super.viewDidLoad()
        entryLabel.text = ""
         i = 0
        mistakes = 0
        t = 0
        updateUI(j: j)
    }
    let brain = lvl1Brain()
    var j = 0
    var t = clock()
    var timings = [String]()
    var name = String()
    let commentsList = ["Okay","Good","Brilliant","Awsome","Excellent","Bravo"]
    
    
    @IBOutlet var lvl1Image: UIImageView!
    @IBOutlet weak var comments: UILabel!
    @IBOutlet weak var entryLabel: UILabel!
    
    
    
    var i : Int = 0
    var mistakes : Int = 0
    
    @IBAction func enterLetter(_ sender: UIButton) {
        
        let delta = (Double(clock()-t)) / Double(CLOCKS_PER_SEC)
        timings.append(String(delta))
        let val = Int.random(in: 0...(commentsList.count-1))
        
        if name.contains(Character(sender.currentTitle!)){
            if i < name.count{
            if  Character(sender.currentTitle!)  == name[name.index(name.startIndex, offsetBy: i)] {
                    entryLabel.text?.append(sender.currentTitle!)
                    i=i+1
                
                comments.text = commentsList[val] //+ playerName!
                
               let utterance = AVSpeechUtterance(string: commentsList[val] + pName )
                utterance.voice = AVSpeechSynthesisVoice(language: "en-IN")
                utterance.rate = 0.28

                let synthesizer = AVSpeechSynthesizer()
                synthesizer.speak(utterance)
                }
            else if Character(sender.currentTitle!)  != name[name.index(name.startIndex, offsetBy: i)] {
                
                let utterance = AVSpeechUtterance(string: "Try again " + pName )
                utterance.voice = AVSpeechSynthesisVoice(language: "en-IN")
                utterance.rate = 0.28

                let synthesizer = AVSpeechSynthesizer()
                synthesizer.speak(utterance)
                mistakes = mistakes + 1
                //print(timings)
                }
            }
            else if i == name.count{
                let utterance = AVSpeechUtterance(string: "Great Job " + pName )
                utterance.voice = AVSpeechSynthesisVoice(language: "en-IN")
                utterance.rate = 0.28
                let synthesizer = AVSpeechSynthesizer()
                synthesizer.speak(utterance)
                //dismiss(animated: true, completion: nil)
                j=j+1
                updateUI(j:j)
                print(timings)
                }
            }
        else{
            let utterance = AVSpeechUtterance(string: "Try again " + pName )
            utterance.voice = AVSpeechSynthesisVoice(language: "en-IN")
            utterance.rate = 0.28

            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(utterance)
            }
        }
    func updateUI(j:Int){
        entryLabel.text = ""
        if j < (brain.data.count){
            //j=j+1
            i=0
            name = brain.retWord(j: j)
            lvl1Image.image = UIImage(named: brain.retImage(j: j))
        }
        else{
            dismiss(animated: true, completion: nil)
        }
    }
    }


