import AnalyticsCore

protocol ___VARIABLE_moduleName___ViewEventTracking: AnyObject {
    func trackScreenView()
}

final class ___VARIABLE_moduleName___EventTracker {
    // MARK: - Private structs

    private struct ScreenView {
        static let key = "feature_flow"
        static let value = "feature_screen_name"
    }

    private struct ExampleUserInteraction {
        static let key = ScreenView.value
        static let value = "example"
    }

    // MARK: - Private properties

    private let analytics: AnalyticsCoreProtocol
    
    // MARK: - Initializer
    
    init(analytics: AnalyticsCoreProtocol) {
        self.analytics = analytics
    }
}

// MARK: - View Tracking
extension ___VARIABLE_moduleName___EventTracker: ___VARIABLE_moduleName___ViewEventTracking {
    func trackScreenView() {
        let event = AEventCore(
            screen: ScreenView.key,
            value: ScreenView.value
        )
        analytics.track(event)
    }

    func trackExampleInteraction() {
        let event = AEventCore(
            userInteraction: ExampleUserInteraction.key,
            value: ExampleUserInteraction.value
        )
        analytics.track(event)
    }
}
