//
//  ViewController.swift
//  CollapsingTableView
//
//  Created by Subhadeep Pal on 19/08/17.
//  Copyright © 2017 Subhadeep Pal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "filterSegue" {
            let menu = segue.destination as! MenuTableViewController
            menu.transitioningDelegate = self
            menu.modalPresentationStyle = .custom
        }
    }

    @IBAction func showMenu(_ sender: Any) {
        performSegue(withIdentifier: "filterSegue", sender: nil)
    }
}


extension ViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let presentationController = SlideInPresentationController(presentedViewController: presented,
                                                                   presenting: presenting,
                                                                   direction: .right)
        return presentationController
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideInPresentationAnimator(direction: .right, isPresentation: true)
        
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideInPresentationAnimator(direction: .right, isPresentation: false)
    }
}
