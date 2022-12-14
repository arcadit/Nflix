// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

// swiftlint:disable sorted_imports
import Foundation
import UIKit

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length implicit_return

// MARK: - Storyboard Scenes

// swiftlint:disable explicit_type_interface identifier_name line_length type_body_length type_name
internal enum StoryboardScene {
  internal enum DownloadsViewController: StoryboardType {
    internal static let storyboardName = "DownloadsViewController"

    internal static let initialScene = InitialSceneType<Netflix_Clone.DownloadsViewController>(storyboard: Self.self)
  }
  internal enum HomeViewController: StoryboardType {
    internal static let storyboardName = "HomeViewController"

    internal static let initialScene = InitialSceneType<Netflix_Clone.HomeViewController>(storyboard: Self.self)
  }
  internal enum SearchResultsViewController: StoryboardType {
    internal static let storyboardName = "SearchResultsViewController"

    internal static let initialScene = InitialSceneType<Netflix_Clone.SearchResultsViewController>(storyboard: Self.self)
  }
  internal enum SearchViewController: StoryboardType {
    internal static let storyboardName = "SearchViewController"

    internal static let initialScene = InitialSceneType<Netflix_Clone.SearchViewController>(storyboard: Self.self)
  }
  internal enum TitlePreviewViewController: StoryboardType {
    internal static let storyboardName = "TitlePreviewViewController"

    internal static let initialScene = InitialSceneType<Netflix_Clone.TitlePreviewViewController>(storyboard: Self.self)
  }
  internal enum UpcomingViewController: StoryboardType {
    internal static let storyboardName = "UpcomingViewController"

    internal static let initialScene = InitialSceneType<Netflix_Clone.UpcomingViewController>(storyboard: Self.self)
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length type_body_length type_name

// MARK: - Implementation Details

internal protocol StoryboardType {
  static var storyboardName: String { get }
}

internal extension StoryboardType {
  static var storyboard: UIStoryboard {
    let name = self.storyboardName
    return UIStoryboard(name: name, bundle: BundleToken.bundle)
  }
}

internal struct SceneType<T: UIViewController> {
  internal let storyboard: StoryboardType.Type
  internal let identifier: String

  internal func instantiate() -> T {
    let identifier = self.identifier
    guard let controller = storyboard.storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
      fatalError("ViewController '\(identifier)' is not of the expected class \(T.self).")
    }
    return controller
  }

  @available(iOS 13.0, tvOS 13.0, *)
  internal func instantiate(creator block: @escaping (NSCoder) -> T?) -> T {
    return storyboard.storyboard.instantiateViewController(identifier: identifier, creator: block)
  }
}

internal struct InitialSceneType<T: UIViewController> {
  internal let storyboard: StoryboardType.Type

  internal func instantiate() -> T {
    guard let controller = storyboard.storyboard.instantiateInitialViewController() as? T else {
      fatalError("ViewController is not of the expected class \(T.self).")
    }
    return controller
  }

  @available(iOS 13.0, tvOS 13.0, *)
  internal func instantiate(creator block: @escaping (NSCoder) -> T?) -> T {
    guard let controller = storyboard.storyboard.instantiateInitialViewController(creator: block) else {
      fatalError("Storyboard \(storyboard.storyboardName) does not have an initial scene.")
    }
    return controller
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
