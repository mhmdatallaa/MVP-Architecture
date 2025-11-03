//
//  Depouncer.swift
//  MVPArchitecture
//
//  Created by Mohamed Atallah on 03/11/2025.
//

import Foundation

@MainActor
final class Depouncer {
    // MARK: - Properties
    private let delay: TimeInterval
    private var pendingWorkItem: DispatchWorkItem?

    // MARK: - Init
    init(delay: TimeInterval) {
        self.delay = delay
    }

    // MARK: - Public Methods
    /// Schedule `action` to run after `delay`. If called again before the delay, the previous action is cancelled.
    func run(action: @escaping () -> Void) {
        // Cancel any existing work
        pendingWorkItem?.cancel()

        // Create new work item
        let workItem = DispatchWorkItem { [weak self] in
            // Ensure we clear the reference when executed
            self?.pendingWorkItem = nil
            action()
        }

        // Store and schedule after delay on the main queue
        pendingWorkItem = workItem
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: workItem)
    }

    /// Cancel any scheduled action that hasn't executed yet.
    func cancel() {
        pendingWorkItem?.cancel()
        pendingWorkItem = nil
    }
}
