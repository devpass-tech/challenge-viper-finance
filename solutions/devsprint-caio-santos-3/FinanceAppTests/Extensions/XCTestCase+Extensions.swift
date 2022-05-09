//
//  XCTestCase+Extensions.swift
//  FinanceAppTests
//
//  Created by Caio Santos on 06/05/22.
//

import XCTest

extension XCTestCase {
    /// Performs a given event from a UIControl into a parent view through Selector
    /// - Parameters:
    ///   - event: The event to be performed (.touchUpInside, .longPress...)
    ///   - button: The button or control executing the action
    ///   - target: The target of the action, who implements the #selector
    ///   - args: The argument of the call, usually the same as the control perfomer
    public func perform(event: UIControl.Event, from button: UIControl, target: AnyObject, args: Any?) {
        let action = button.actions(forTarget: target, forControlEvent: event)?.first ?? ""
        target.performSelector(onMainThread: Selector(action), with: args, waitUntilDone: true)
    }
    
    /// Performs an action for a given UIBarButtonItem
    /// - Parameters:
    ///   - barButtonItem: The UIBarButtonItem that will perform the action
    public func perform(actionFor barButtonItem: UIBarButtonItem) {
        _ = barButtonItem.target?.perform(barButtonItem.action)
    }
 
    /// Finds and performs given UIGestureRecognizer.Type on the given view
    /// - Parameters:
    ///   - type: The type of the gesture (UITapGestureRecoginizer, UILongPressGestureRecognizer...)
    ///   - view: The view which performs the action
    ///   - target: The target of the action, who implements the #selector
    public func performGestureRecognizer<T>(type: T.Type, on view: UIView, target: AnyObject) {
        let gesture = view.gestureRecognizers?.first { $0 is T }

        let targetAction = (gesture?.value(forKey: "_targets") as? [NSObject])?.first
        let selectorString = String(describing: targetAction)
            .components(separatedBy: ", ")
            .first?
            .replacingOccurrences(of: "(action=", with: "")
            .replacingOccurrences(of: "Optional(", with: "") ?? ""

        let _ = target.perform(.init(stringLiteral: selectorString))
    }
}

