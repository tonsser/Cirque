
Pod::Spec.new do |s|
  s.name             = 'Cirque'
  s.version          = '1.0.2'
  s.summary          = 'A multi color gradient circle progress view'
  s.description      = <<-DESC
Cirque is an iOS component that enables you to draw multi color circle strokes with gradient trasitions between colors.
                       DESC
  
  s.homepage         = 'https://github.com/tonsser/Cirque'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'philipengberg' => 'philipengberg@gmail.com' }
  s.source           = { :git => 'https://github.com/tonsser/Cirque.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'Cirque/Classes/**/*'
end