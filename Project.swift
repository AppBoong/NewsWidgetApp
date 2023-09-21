import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin

/*
                +-------------+
                |             |
                |     App     | Contains NewsWidgetApp App target and NewsWidgetApp unit-test target
                |             |
         +------+-------------+-------+
         |         depends on         |
         |                            |
 +----v-----+                   +-----v-----+
 |          |                   |           |
 |   Kit    |                   |     UI    |   Two independent frameworks to share code and start modularising your app
 |          |                   |           |
 +----------+                   +-----------+

 */

// MARK: - Project

// Local plugin loaded
let localHelper = LocalHelper(name: "MyPlugin")

// Creates our project using a helper function defined in ProjectDescriptionHelpers
//let project = Project.app(name: "NewsWidgetApp",
//                          platform: .iOS,
//                          additionalTargets: ["NewsWidgetAppKit", "NewsWidgetAppUI"])

let name = "NewsWidgetApp"

let infoPlist: [String: InfoPlist.Value] = [
    "CFBundleShortVersionString": "1.0",
    "CFBundleVersion": "1",
    "UIMainStoryboardFile": "",
    "UILaunchStoryboardName": "LaunchScreen"
]

let project = Project(
    name: name,
    organizationName: "com.Appboong",
    packages: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", from: "1.2.0"),
        .package(url: "https://github.com/Alamofire/Alamofire", from: "5.8.0")],
    targets: [
        .init(
            name: name,
            platform: .iOS,
            product: .app,
            bundleId: "com.Appboong.\(name)",
            deploymentTarget: .iOS(targetVersion: "16.0",
                                   devices: .iphone,
                                   supportsMacDesignedForIOS: true),
            infoPlist: .extendingDefault(with: infoPlist),
            sources: ["Targets/\(name)/Sources/**"],
            resources: ["Targets/\(name)/Resources/**"],
            dependencies: [.package(product: "ComposableArchitecture"),
                           .package(product: "Alamofire")],
            settings: .settings(base: ["DEVELOPMENT_TEAM": "Jaeyeol Lee"])
        ),
    ]
)
