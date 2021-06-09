import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(WebViewLoginModuleTests.allTests),
    ]
}
#endif
