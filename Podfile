platform :ios, '10.0'

# ignore all warnings from all pods
inhibit_all_warnings!

target 'RGViperChat' do
  use_frameworks!

  # Pods for RGViperChat
  pod 'SwiftLint'
  pod 'JSQMessagesViewController'
  pod 'Firebase/Core'
  pod 'Firebase/Database'
  pod 'Firebase/Auth'
  pod 'FontAwesome.swift'
  pod 'DZNEmptyDataSet'
  pod 'DGActivityIndicatorView'
  
  target 'RGViperChatTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'Firebase'
    pod 'Quick'
    pod 'Nimble'
    pod 'Cuckoo'
  end
  
  target 'RGViperChatUITests' do
    inherit! :search_paths
    # Pods for UI testing
  end

end
