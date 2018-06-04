Pod::Spec.new do |s|
  s.name         = "ServiceProvider"
  s.version      = "1.0.0"
  s.summary      = "Wrapper for the service for swift to hide the details of its creation."
  s.description  = <<-DESC
			Written in Swift.
			Wrapper for the service to hide the details of its creation.
            Allows you to create your custom IoC Container or ServiceLocator.
                   DESC

  s.homepage     = "https://github.com/ProVir/ServiceProvider"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "ViR (Vitaliy Korotkiy)" => "admin@provir.ru" }
  s.source       = { :git => "https://github.com/ProVir/ServiceProvider.git", :tag => "#{s.version}" }

  s.swift_version = '4'

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.source_files = 'ServiceProvider/*.{h,swift}'
  s.public_header_files = 'ServiceProvider/*.h'

end
