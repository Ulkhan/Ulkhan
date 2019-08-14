
Pod::Spec.new do |spec|

spec.name         = "Ulkhan"
spec.version      = "1.0.1"
spec.summary      = "An iOS Framework for Networking, LocalizationManager and some handy Extensions."

spec.description  = "This framework made by Ulkhan Amiraslanov and includes NetworkingServices built on top of URLSession, LocalizationManager and some handy extensions such as, safeValue for Optional String"
spec.license      = "MIT"
spec.author             = { "Ulkhan Amiraslanov" => "“ulxanemi5@gmail.com”" }
spec.platform     = :ios, "10.0"
spec.source       = { :git => "https://github.com/Ulkhan/Ulkhan.git", :tag => "1.0.1" }
spec.homepage     = "https://github.com/Ulkhan/Ulkhan.git"
spec.source_files  = 'Ulkhan/**/*.swift'

spec.swift_version = '5.0'

end
