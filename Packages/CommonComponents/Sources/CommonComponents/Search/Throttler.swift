//
//  Throttler.swift
//  CommonComponents
//
//  Created by Talip on 23.03.2022.
//

import Foundation

public protocol Throttable {
    /// Method will throttle block within defined delay time.
    func throttle(_ block: @escaping () -> Void)
    /// To cancel manually Throttable
    func cancel()
    /// Notifies when the Work Item terminated
    var didTaskFinished: (() -> Void)? { get set }
}

final public class Throttler: Throttable {
    private var task: DispatchWorkItem?
    private let delay: Double
    public var didTaskFinished: (() -> Void)?
    private let queue: DispatchQueue

    public init(delay: Double = 0.5,
         queue: DispatchQueue = .main) {
        self.delay = delay
        self.queue = queue
    }

    public func throttle(_ block: @escaping () -> Void) {
        cancel()
        let workItem = DispatchWorkItem(block: block)
        task = workItem
        task?.notify(queue: queue,
                     execute: { [ weak self] in
            self?.didTaskFinished?()
        })
        queue.asyncAfter(deadline: DispatchTime.now() + delay,
                         execute: workItem)
    }

    public func cancel() {
        task?.cancel()
        task = nil
    }
}
