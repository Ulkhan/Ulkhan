

Pod::Spec.new do |s|

s.name         = "Ulkhan"
s.version      = "1.0.1"
s.summary      = "An iOS Framework for Networking, LocalizationManager and some handy Extensions."
s.description  = "This framework made by Ulkhan Amiraslanov and includes NetworkingServices built on top of URLSession, LocalizationManager and some handy extensions such as, safeValue for Optional String."
s.homepage     = "https://github.com/Ulkhan/Ulkhan.git"
s.license      = "MIT"
s.author       = { "Ulkhan Amiraslanov" => "ulxanemi5@gmail.com" }
s.platform     = :ios, "11.0"
s.source       = { :git => "https://github.com/Ulkhan/Ulkhan.git", :tag => "1.0.1" }
s.source_files = "Ulkhan/**/*.{h,m,swift}"
s.exclude_files = "Ulkhan/*.plist"
s.swift_version = '5.0'

end
