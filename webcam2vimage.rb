#!/usr/bin/env ruby

require 'net/http'
require 'uri'
require 'base64'

jpeg = `fswebcam --skip 10 --resolution 640x480 --jpeg -1 --greyscale -`
exit -1 unless jpeg

res = Net::HTTP.post_form(
  URI.parse('http://vimage.herokuapp.com/images/new'),
  {
    title: Time.now.to_s,
    url: nil,
    tags: ['webcam2vimage'].join(' '),
    base64: Base64::encode64(jpeg),
  }
)
p res
