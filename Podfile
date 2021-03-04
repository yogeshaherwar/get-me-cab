# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def rx_swift
  pod 'RxSwift','~> 5.1.1'
  pod 'RxSwiftExt', '~> 5.1.1'
end

def injector
  pod 'Swinject', '~> 2.6.1'
  pod 'SwinjectStoryboard', '~> 2.2.0'
end

def object_mapper
  pod 'ObjectMapper', '~> 3.5.1'
end

def google_maps
  pod 'GoogleMaps', '= 3.10.0-beta1'
  pod 'GooglePlaces', '= 3.10.0-beta1'
end

def kingfisher
  pod 'Kingfisher', '~> 5.0'
end

target 'GetMeCab' do
  rx_swift
  injector
  object_mapper
  google_maps
  kingfisher
end
