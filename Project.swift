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

let project = Project(
    name: name,
    organizationName: "com.Appboong",
    packages: [],
    targets: [
        .init(
            name: name,
            platform: .iOS,
            product: .app,
            bundleId: "com.Appboong.\(name)",
            deploymentTarget: .iOS(targetVersion: "16.0",
                                   devices: .iphone,
                                   supportsMacDesignedForIOS: true),
            infoPlist: .default,
            sources: ["Targets/\(name)/Sources/**"],
            resources: ["Targets/\(name)/Resources/**"],
            dependencies: []
        ),
    ]
)
