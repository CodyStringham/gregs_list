# -*- coding: utf-8 -*-
$:.unshift('/Library/RubyMotion/lib')
require 'motion/project/template/ios'
require 'bundler'
Bundler.require

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'ps4_lfg'
  app.identifier = 'com.your_domain_here.ps4_lfg'
  app.short_version = '0.1.0'
  app.version = app.short_version

  # SDK 8 for iOS 8 and above
  app.sdk_version = '8.4'
  # app.deployment_target = '8.0'

  # all app icons
  app.icons = Dir.glob("resources/AppIcon*.png").map{|icon| icon.split("/").last}

  app.files += Dir.glob(File.join(app.project_dir, 'lib/**/*.rb'))

  # app device config
  app.device_family = [:iphone, :ipad]
  app.interface_orientations = [:portrait, :landscape_left, :landscape_right, :portrait_upside_down]

  # White status bar for dark background
  app.info_plist["UIViewControllerBasedStatusBarAppearance"] = false
  app.info_plist["UIStatusBarStyle"] = "UIStatusBarStyleLightContent"

  app.pods do
    pod 'AFNetworking'
    pod 'SVProgressHUD'
    # pod 'FXForms'
    # pod 'JMImageCache'
  end

  app.development do
    app.codesign_certificate = "iPhone Developer: Cody Stringham"
    app.provisioning_profile = '/Users/cody/Library/MobileDevice/Provisioning Profiles/Access_Labs.mobileprovision'
  end

  app.release do
    app.entitlements['get-task-allow'] = false
    app.codesign_certificate = 'iPhone Distribution: Cody Stringham'
    app.provisioning_profile = "signing/ps4_lfg.mobileprovision"
    app.seed_id = "YOUR_SEED_ID"
    app.entitlements['application-identifier'] = app.seed_id + '.' + app.identifier
    app.entitlements['keychain-access-groups'] = [ app.seed_id + '.' + app.identifier ]
  end

  puts "Name: #{app.name}"
  puts "Using profile: #{app.provisioning_profile}"
  puts "Using certificate: #{app.codesign_certificate}"

end
