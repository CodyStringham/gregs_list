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
  app.name = 'PS4 LFG'
  app.provisioning_profile = '~/Library/MobileDevice/Provisioning Profiles/Access_Labs.mobileprovision'

  # all app icons
  app.icons = Dir.glob("resources/AppIcon*.png").map{|icon| icon.split("/").last}

  # White status bar for dark background
  app.info_plist["UIViewControllerBasedStatusBarAppearance"] = false
  app.info_plist["UIStatusBarStyle"] = "UIStatusBarStyleLightContent"
end
