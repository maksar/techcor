SimpleCov.start do
  add_group "Code" do |file|
    file.filename.include?(File.dirname(__FILE__) + "/lib/")
  end
  add_group "Cucumber" do |file|
    file.filename.include?(File.dirname(__FILE__) + "/features/")
  end
  add_group "Rspec" do |file|
    file.filename.include?(File.dirname(__FILE__) + "/spec/")
  end
end
