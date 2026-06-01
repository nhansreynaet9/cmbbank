//
//  UINavigationController+SwipeBack.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 19/5/26.
////
//
import UIKit

extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}
