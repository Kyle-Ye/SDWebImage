//
//  DemoTests.swift
//
//
//  Created by Kyle on 2023/2/23.
//
import SDWebImage
import SDWebImageSwift
import UIKit
import XCTest

final class DemoTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
}

public enum Test {
    case storeCache(SDImageCache)
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let imageView = UIImageView()
        let url = URL(string: "https://via.placeholder.com/100")

        imageView.sd.testOnlyCurrentModule(with: url)
        imageView.sd.testSubmoduleType(with: url)
        imageView.sd.setImage(with: url)
    }
}
