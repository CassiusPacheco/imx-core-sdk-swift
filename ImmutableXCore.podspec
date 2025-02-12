Pod::Spec.new do |spec|
    spec.name                  = 'ImmutableXCore'
    spec.version               = '1.0.0-beta.1'
    spec.summary               = 'The ImmutableX Core SDK Swift for applications written on the ImmutableX platform.'

    spec.description           = <<-DESC
    The Immutable Core SDK Swift provides convenient access to the Immutable API's for applications written on the ImmutableX platform.
                     DESC

    spec.homepage              = 'https://github.com/immutable/imx-core-sdk-swift'
    spec.documentation_url     = 'https://docs.x.immutable.com/sdk-docs/core-sdk-swift/overview'
    spec.license               = { :type => 'Apache License 2.0', :file => 'LICENSE' }
    spec.author                = { 'Immutable' => 'opensource@immutable.com'}

    spec.source                = { :git => 'https://github.com/immutable/imx-core-sdk-swift.git', :tag => "v1.0.0-beta.1" }
    spec.source_files          = 'Sources/**/*.swift'

    spec.swift_version         = '5.7'

    spec.ios.deployment_target = '13'
    spec.osx.deployment_target = '10.15'

    spec.dependency 'AnyCodable-FlightSchool', '~> 0.6'
    spec.dependency 'BigInt', '~> 5.2.0'
    spec.dependency 'secp256k1Swift', '~> 0.7.4'
  end
