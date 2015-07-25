describe SinatraCmd do
  it "Generator sinatra" do
    bin_path = File.join(File.expand_path('../../bin', __FILE__))
    system("#{bin_path}/sinatra test-project --skip_bundle_install")
  end
end
