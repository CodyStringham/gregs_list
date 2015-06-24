# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'ps4_lfg_ios'
  app.provisioning_profile = '/Users/cody/Library/MobileDevice/Provisioning Profiles/Access_Labs.mobileprovision'

  # White status bar for dark background
  app.info_plist["UIViewControllerBasedStatusBarAppearance"] = false
  app.info_plist["UIStatusBarStyle"] = "UIStatusBarStyleLightContent"
end
