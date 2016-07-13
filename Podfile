abstract_target 'MaterialMotionTransitions' do
	pod 'MaterialMotionTransitions', :path => './'

  # To depend on the latest release
  #pod 'MaterialMotionRuntime'

  # To depend on the bleeding edge
  pod 'MaterialMotionRuntime' , :git => 'git@github.com:material-motion/material-motion-runtime-objc.git', :branch => 'develop'

  # To depend on a local modification to the runtime
  #pod 'MaterialMotionRuntime' , :git => '/path/to/runtime-objc', :branch => 'develop'

  workspace 'MaterialMotionTransitions.xcworkspace'
	use_frameworks!

	target "UnitTests" do
		project 'tests/apps/UnitTests/UnitTests.xcodeproj'
	end
end