Pod::Spec.new do |s|
  s.name         = "LineKit"
  s.version      = "1.4.1"
  s.summary      = "Share to Naver Line from your apps."
  s.homepage     = "https://github.com/dlackty/LineKit"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author       = { "Richard Lee" => "dlackty@gmail.com" }
  s.source       = { :git => "https://github.com/dlackty/LineKit.git", :tag => s.version }
  s.platform     = :ios, '6.0'

  s.source_files = 'LineKit/*.{h,m}'
  s.resources    = "LineKit/images/*.png"

  s.social_media_url = "https://twitter.com/dlackty"
  s.requires_arc = true
end
