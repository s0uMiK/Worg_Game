//
//  level3.swift
//  Demensia
//
//  Created by Soumik Mukherjee on 24/02/20.
//  Copyright © 2020 Soumik Mukherjee. All rights reserved.
//

import UIKit
import AVFoundation
import Foundation
class level3 : UIViewController,AVAudioPlayerDelegate{
    override func viewDidLoad() {
        super.viewDidLoad()
        entryLabel3.text = ""
         i = 0
        mistakes = 0
        t = 0
        
    }
    let brain = lvl1Brain()
    var t = clock()
    var mistakes : Int = 0
    var timings = [String]()
    var name = String()
    let commentsList = ["Okay","Good","Brilliant","Awsome","Excellent","Bravo"]
    
    @IBOutlet weak var entryLabel3: UILabel!
    @IBOutlet weak var coments: UILabel!
    @IBOutlet var lvl3Image: UIImageView!
    
    
    
    var i : Int = 0
    
    @IBAction func enterLetter(_ sender: UIButton) {
           let delta = (Double(clock()-t)) / Double(CLOCKS_PER_SEC)
            timings.append(String(delta))
        let val = Int.random(in: 0...(commentsList.count - 1))
            
            if name.contains(Character(sender.currentTitle!)){
                if i < name.count{
                if  Character(sender.currentTitle!)  == name[name.index(name.startIndex, offsetBy: i)] {
                    entryLabel3.text?.append(sender.currentTitle!)
                        i=i+1
                    
                    coments.text = commentsList[val] //+ playerName!
                    
                   let utterance = AVSpeechUtterance(string: commentsList[val] + pName)
                    utterance.voice = AVSpeechSynthesisVoice(language: "en-IN")
                    utterance.rate = 0.1

                    let synthesizer = AVSpeechSynthesizer()
                    synthesizer.speak(utterance)
                    }
                else if Character(sender.currentTitle!)  != name[name.index(name.startIndex, offsetBy: i)] {
   
                    let utterance = AVSpeechUtterance(string: "Try again ")// + playerName!)
                    utterance.voice = AVSpeechSynthesisVoice(language: "en-IN")
                    utterance.rate = 0.1

                    let synthesizer = AVSpeechSynthesizer()
                    synthesizer.speak(utterance)
                    mistakes = mistakes + 1
                    }
                }
                else if i == name.count{
                    let utterance = AVSpeechUtterance(string: "Great Job " + pName)
                    utterance.voice = AVSpeechSynthesisVoice(language: "en-IN")
                    utterance.rate = 0.1
                    let synthesizer = AVSpeechSynthesizer()
                    synthesizer.speak(utterance)
                    dismiss(animated: true, completion: nil)
                    print(timings)
                    }
                }
            else{
    
                let utterance = AVSpeechUtterance(string: "Try again " + pName)
                utterance.voice = AVSpeechSynthesisVoice(language: "en-IN")
                utterance.rate = 0.25

                let synthesizer = AVSpeechSynthesizer()
                synthesizer.speak(utterance)
                }
            }
        func updateUI(j:Int){
            entryLabel3.text = ""
            if j < (brain.data.count){
                //j=j+1
                i=0
                name = brain.retWord(j: j)
                lvl3Image.image = UIImage(named: brain.retImage(j: j))
            }
            else{
                dismiss(animated: true, completion: nil)
            }
        }
        }


