require 'test/unit'

$:.unshift(File::join(File::dirname(__FILE__), "..", "lib"))
$:.unshift(File::join(File::dirname(__FILE__), "..", "ext", "augeas"))
require 'augeas'

class TestAugeas < Test::Unit::TestCase
    def test_basics
        aug = Augeas::open("/tmp", Augeas::SAVE_NEWFILE)
        assert_equal("newfile", aug.get("/augeas/save"))
        assert_equal("/tmp", aug.get("/augeas/root"))

        assert(aug.exists("/augeas/root"))
        assert_not_nil(aug.get("/augeas/root"))
        assert_nothing_raised {
            aug.set("/ruby/test/node", "value")
        }
        assert_equal("value", aug.get("/ruby/test/node"))
        m = aug.match("*")
        ["/system", "/system/config",
         "/augeas", "/augeas/root",
         "/ruby", "/ruby/test"].each do |p|
            assert(m.include?(p))
            assert(aug.exists(p))
        end
        l = aug.ls("/ruby");
        assert_equal(["/ruby/test"], l)
    end

    def test_no_new
        assert_raise NoMethodError do
            Augeas.new
        end
    end
end
