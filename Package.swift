// swift-tools-version:5.6

// Copyright 2025 Google LLC.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import PackageDescription

let package = Package(
  name: "VerveAdapter",
  platforms: [.iOS(.v13)],
  products: [
    .library(
      name: "VerveAdapterTarget",
      targets: ["VerveAdapterTarget"]
    )
  ],
  dependencies: [
    .package(
      url: "https://github.com/vervegroup/hybid-ios-spm-sdk.git",
      exact: "3.8.0"
    ),
    .package(
      url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
      from: "13.0.0"
    ),
  ],
  targets: [
    .target(
      name: "VerveAdapterTarget",
      dependencies: [
        .target(name: "VerveAdapter"),
        .product(name: "HyBid", package: "hybid-ios-spm-sdk"),
        .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
      ],
      path: "VerveAdapterTarget"
    ),
    .binaryTarget(
      name: "VerveAdapter",
      url:
        "https://dl.google.com/googleadmobadssdk/mediation/ios/verve/VerveAdapter-3.8.0.0.zip",
      checksum: "c60fc855b1b95bf3d0073610886d02e729e1b2835215d594c699516c2b313c4f"
    ),
  ]
)
