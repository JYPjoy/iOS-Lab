//
//  ViewController.swift
//  TTSExample
//
//  Created by Jiyoung Park on 2021/09/07.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    let synthesizer = AVSpeechSynthesizer()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = "This is a dog"
        textLabel.numberOfLines = 0
        
//        let allVoices =  AVSpeechSynthesisVoice.speechVoices()
//
//        var index = 0
//        for theVoice in allVoices {
//            print("Voice[\(index)] = \(theVoice)\n")
//            index += 1

    }
       
    @IBAction func ttsStartClicked(_ sender: UIButton) {
        let utterance = AVSpeechUtterance(string: textLabel.text!)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        synthesizer.speak(utterance)
        
    }
    

}


// 공식문서
