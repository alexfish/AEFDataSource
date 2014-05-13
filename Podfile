workspace 'AEFDataSource'

xcodeproj 'Tests/AEFDataSourceTests.xcodeproj'
xcodeproj 'Example/AEFDataSource Example.xcodeproj'

def install_pod
    pod "AEFDataSource", :path => "AEFDataSource.podspec"
end

target "AEFDataSource Tests" do
    xcodeproj 'Tests/AEFDataSource Tests.xcodeproj'
    pod 'OCMock', '~> 2.1.1'
    install_pod
end

target "AEFDataSource Example" do
    xcodeproj 'Example/AEFDataSource Example.xcodeproj'
    install_pod
end