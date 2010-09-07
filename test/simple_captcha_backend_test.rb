
require File.join(File.dirname(__FILE__), 'test_helper')

class SimpleCaptchaBackendTest < ActiveSupport::TestCase

  test 'RMagickBackend responds to generate_simple_captcha_image' do
    assert SimpleCaptcha::RMagickBackend.respond_to? :generate_simple_captcha_image
  end

  test 'QuickMagickBackend responds to generate_simple_captcha_image' do
    assert SimpleCaptcha::QuickMagickBackend.respond_to? :generate_simple_captcha_image
  end

  include SimpleCaptcha::ImageHelpers

  test 'RMagickBackend generates image blob' do
    SimpleCaptcha::CaptchaUtils.stubs(:simple_captcha_value).returns('HeLLo')
    SimpleCaptcha.backend = :RMagick
    
    ret = generate_simple_captcha_image
    #ret = SimpleCaptcha::RMagickBackend.generate_simple_captcha_image opts
    assert_not_nil ret
    assert_instance_of String, ret
  end

  test 'QuickMagickBackend generates image blob' do
    SimpleCaptcha::CaptchaUtils.stubs(:simple_captcha_value).returns('HeLLo')
    SimpleCaptcha.backend = :quick_magick

    ret = generate_simple_captcha_image
    #ret = SimpleCaptcha::QuickMagickBackend.generate_simple_captcha_image :captcha_text => 'hello'
    assert_not_nil ret
    assert_instance_of String, ret
  end

end