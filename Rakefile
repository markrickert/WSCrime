# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'bundler'
Bundler.require

Motion::Project::App.setup do |app|
  app.name = 'W-S Crime'
  app.identifier = 'com.mohawkapps.Winston-Salem-Crime'
  app.frameworks += ['CoreLocation', 'MapKit']
  app.device_family = [:iphone, :ipad]
  app.version = '1.4'
  app.short_version = '7'
  app.interface_orientations = [:portrait, :landscape_left, :landscape_right, :portrait_upside_down]
  app.deployment_target = "5.0"

  #Add Flurry Analytics as a static library.
  app.vendor_project('vendor/FlurryAnalytics', :static,
    :products => ['libFlurryAnalytics.a'],
    :headers_dir => 'vendor/FlurryAnalytics')

  app.codesign_certificate = "iPhone Developer: Mark Rickert (YA2VZGDX4S)"
  app.provisioning_profile = "/Volumes/mrickert/Library/MobileDevice/Provisioning\ Profiles/EF63CB15-B5E7-4FB6-9A8C-07A8F09AA8AD.mobileprovision"  

  app.pods do
    pod 'CKCalendar'
    pod 'NSDate-Extensions'
  end

  app.development do
    # This entitlement is required during development but must not be used for release.
    app.entitlements['get-task-allow'] = true
  end

end