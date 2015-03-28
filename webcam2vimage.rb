#!/usr/bin/env ruby

require 'net/http'
require 'uri'
require 'base64'

jpeg = `fswebcam --skip 10 --resolution 640x480 --jpeg 50 --greyscale --read -`
exit -1 unless jpeg

res = Net::HTTP.post_form(
  URI.parse('http://vimage.herokuapp.com/images/new'),
  {
    title: "#{illust.member_name} - #{illust.title}",
    url: nil,
    tags: ['webcam2vimage'].join(' '),
    base64: Base64::encode64(jpeg),
  }
)
p res
