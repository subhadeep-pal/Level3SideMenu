//
//  SlideInPresentationAnimator.swift
//  MedalCount
//
//  Created by 01HW934413 on 24/03/17.
//  Copyright © 2017 Ron Kliffer. All rights reserved.
//

import UIKit

enum PresentationDirection {
    case left
    case top
    case right
    case bottom
}

class SlideInPresentationAnimator: NSObject {
  
  // MARK: - Properties
  let direction: PresentationDirection
  let isPresentation: Bool
  
  
  // MARK: - Initializers
  init(direction: PresentationDirection, isPresentation: Bool) {
    self.direction = direction
    self.isPresentation = isPresentation
    super.init()
  }
}

extension SlideInPresentationAnimator: UIViewControllerAnimatedTransitioning {
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return 0.3
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    let key = isPresentation ? UITransitionContextViewControllerKey.to : UITransitionContextViewControllerKey.from
    let otherKey = isPresentation ? UITransitionContextViewControllerKey.from : UITransitionContextViewControllerKey.to
    
    let controller = transitionContext.viewController(forKey: key)!
    let fromController = transitionContext.viewController(forKey: otherKey)!
    
    //Presenting or Dismissing VC
    if isPresentation {
      transitionContext.containerView.addSubview(controller.view)
    }
    
    let presentedFrame = transitionContext.finalFrame(for: controller)
    var dismissalFrame = presentedFrame
    
    switch direction{
    case .left:
      dismissalFrame.origin.x = -presentedFrame.width
    case .right:
      dismissalFrame.origin.x = transitionContext.containerView.frame.size.width
    case .top:
      dismissalFrame.origin.y = -presentedFrame.height
    case .bottom:
      dismissalFrame.origin.y = transitionContext.containerView.frame.size.height
    }
    
    let initialFrame = isPresentation ? dismissalFrame : presentedFrame
    let finalFrame = isPresentation ? presentedFrame : dismissalFrame
    
    let animationDuration = transitionDuration(using: transitionContext)
    controller.view.frame = initialFrame
    
    //Original VC
    //reduce x by width if presenting
    var finalFrameForOriginalController = fromController.view.frame
    if isPresentation {
        finalFrameForOriginalController.origin.x = -presentedFrame.width
    } else {
        finalFrameForOriginalController.origin.x = 0
    }
    
    UIView.animate(withDuration: animationDuration, animations: {
        controller.view.frame = finalFrame
        fromController.view.frame = finalFrameForOriginalController
    }) { finished in
      transitionContext.completeTransition(finished)
    }
  }
}
