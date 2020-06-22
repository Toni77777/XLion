Pod::Spec.new do |spec|
  spec.name         = "XLion"
  spec.version      = "0.0.1"
  spec.summary      = "Lightweight library for REST API"
  spec.description  = "XLion - simple lightweight library for REST API written in Swift. Uses standard Apple Codable protocol for decode/encode JSON"
  spec.homepage     = "https://github.com/Toni77777/XLion"
  spec.license      = "MIT"
  spec.author             = { "Anton Paliakov" => "toxa95401@gmail.com" }
  spec.platform     = :ios, "13.0"
  spec.source       = { :git => "https://github.com/Toni77777/XLion.git", :tag => "#{spec.version}" }
  spec.source_files  = "XLion/*.swift"
  spec.swift_version = "4.2"
end
