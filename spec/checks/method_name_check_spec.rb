require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Roodi::Checks::MethodNameCheck do
  before(:each) do
    @roodi = Roodi::Core::ParseTreeRunner.new(Roodi::Checks::MethodNameCheck.new)
  end
  
  it "should accept method names with underscores" do
    content = <<-END
    def good_method_name
    end
    END
    @roodi.check_content(content)
    @roodi.errors.should be_empty
  end

  it "should accept method names with numbers" do
    content = <<-END
    def good_method_1_name
    end
    END
    @roodi.check_content(content)
    @roodi.errors.should be_empty
  end

  it "should accept method names ending a question mark" do
    content = <<-END
    def good_method_name?
    end
    END
    @roodi.check_content(content)
    @roodi.errors.should be_empty
  end

  it "should accept method names ending an exclamation mark" do
    content = <<-END
    def good_method_name!
    end
    END
    @roodi.check_content(content)
    @roodi.errors.should be_empty
  end

  it "should accept method names ending an equals sign" do
    content = <<-END
    def good_method_name=
    end
    END
    @roodi.check_content(content)
    @roodi.errors.should be_empty
  end

  it "should accept << as a method name" do
    content = <<-END
    def <<
    end
    END
    @roodi.check_content(content)
    @roodi.errors.should be_empty
  end

  it "should accept >> as a method name" do
    content = <<-END
    def >>
    end
    END
    @roodi.check_content(content)
    @roodi.errors.should be_empty
  end

  it "should accept == as a method name" do
    content = <<-END
    def ==
    end
    END
    @roodi.check_content(content)
    @roodi.errors.should be_empty
  end

  it "should accept === as a method name" do
    content = <<-END
    def ===
    end
    END
    @roodi.check_content(content)
    @roodi.errors.should be_empty
  end

  it "should accept < as a method name" do
    content = <<-END
    def <
    end
    END
    @roodi.check_content(content)
    @roodi.errors.should be_empty
  end

  it "should accept <= as a method name" do
    content = <<-END
    def <=
    end
    END
    @roodi.check_content(content)
    @roodi.errors.should be_empty
  end

  it "should accept > as a method name" do
    content = <<-END
    def >
    end
    END
    @roodi.check_content(content)
    @roodi.errors.should be_empty
  end

  it "should accept >= as a method name" do
    content = <<-END
    def >=
    end
    END
    @roodi.check_content(content)
    @roodi.errors.should be_empty
  end

  it "should accept [] as a method name" do
    content = <<-END
    def []
    end
    END
    @roodi.check_content(content)
    @roodi.errors.should be_empty
  end

  it "should accept []= as a method name" do
    content = <<-END
    def []=
    end
    END
    @roodi.check_content(content)
    @roodi.errors.should be_empty
  end

  it "should reject camel case method names" do
    content = <<-END
    def badMethodName
    end
    END
    @roodi.check_content(content)
    errors = @roodi.errors
    errors.should_not be_empty
    errors[0].should eql("dummy-file.rb:1 - Method name \"badMethodName\" should match pattern /^[_a-z<>=\\[\\]|+-\\/\\*`]+[_a-z0-9_<>=~@\\[\\]]*[=!\\?]?$/")
  end
end
