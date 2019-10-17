//
//  TESTFeedbackViewController.swift
//  DemoSwiftyCam
//
//  Created by Tesla on 2019/10/16.
//  Copyright © 2019 Cappsule. All rights reserved.
//

import UIKit

class TESTFeedbackViewController: UIViewController,SwiftyCamButtonDelegate {
    
    func buttonWasTapped() {
        UISelectionFeedbackGenerator().selectionChanged()
    }
    
    func buttonDidBeginLongPress() {
        
    }
    
    func buttonDidEndLongPress() {
        
    }
    
    func longPressDidReachMaximumDuration() {
        
    }
    
    func setMaxiumVideoDuration() -> Double {
        return 10
    }
    

    @IBOutlet weak var clickAction: SwiftyCamButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clickAction.delegate = self
        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
