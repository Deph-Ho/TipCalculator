//
//  SettingsViewController.swift
//  Calculator
//
//  Created by Derek Ho on 12/28/16.
//  Copyright © 2016 Dephanie Ho. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let tipPercentages = [0.15, 0.18, 0.2]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipValue = defaults.doubleForKey("default_tip_percentage")
        
        if let index = tipPercentages.indexOf(tipValue)
        {
            tipControl.selectedSegmentIndex = index
        }
        else
        {
            tipControl.selectedSegmentIndex = 0
        }
    }
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBAction func setTipAmount(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(tipPercentages[tipControl.selectedSegmentIndex], forKey:"default_tip_percentage")
        defaults.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
