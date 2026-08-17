// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = Version("1.46.0")

let gitUrl = "https://maven.sumsub.com/repository/releases/IdensicMobileSDK-iOS/\(version)"
let mavenUrl = "https://maven.sumsub.com/repository/maven-private"

enum checksums {
    static let eid = "43b9bf1c299bfce8ce27db24898fd21081650eb64a0f6865d86fda920a07aac4"
    static let aal = "f2d454bb0eb4ca34e852726d2b802a48866769bcce093d8635ec8f5aa5f69d75"
}

let package = Package(
    name: "IdensicMobileSDK_EID",
    platforms: [
        .iOS("13.0")
    ],
    products: [
        .library(
            name: "IdensicMobileSDK_EID",
            targets: [
                "EIDWrapper"
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/SumSubstance/IdensicMobileSDK-iOS.git", .exact(version))
    ],
    targets: [
        .binaryTarget(
            name: "IdensicMobileSDK_EID",
            url: "\(gitUrl)/IdensicMobileSDK_EID-\(version).zip",
            checksum: checksums.eid
        ),
        .binaryTarget(
            name: "AuthadaAuthenticationLibrary",
            url: "\(mavenUrl)/de/authada/library/aal-ios/1.4.1/aal-ios-1.4.1.zip",
            checksum: checksums.aal
        ),
        .target(
            name: "EIDWrapper",
            dependencies: [
                .product(name: "IdensicMobileSDK", package: "IdensicMobileSDK-iOS"),
                "IdensicMobileSDK_EID",
                "AuthadaAuthenticationLibrary"
            ],
            path: "EIDWrapper"
        )
    ]
)
