# Description:
#   Basic scripts that listen for a prompt and return an associated static message

http = require 'http'
decode = require 'unescape';

module.exports = (robot) ->

  robot.respond /universe/gim, (res) ->
    res.send "> GitHub is great, and Training Day is greater!!"

  robot.respond /USERNAME/gim, (res) ->
    res.send " > That person is awesome"

  robot.respond /fruit/gim, (res) ->
    res.send " > My favorites are apples and grapes."

  robot.respond /movie/gim, (res) ->
    res.send " > My favorite movie is The Wizard of Oz"

  robot.respond /lunch/gim, (res) ->
    res.send " > I want a peanut butter and jelly sandwich for lunch today."
  
  robot.respond /quote/gim, (res) ->
    http.get { host: 'quotesondesign.com', path: '/wp-json/posts?filter[orderby]=rand&filter[posts_per_page]=1' }, (get_res) ->
      data = ''
      get_res.on 'data', (chunk) ->
          data += chunk.toString()
      get_res.on 'end', () ->
          res.send " > " + decode(JSON.parse(data)[0].content, 'all').replace(/<(?:.|\n)*?>/gm, '');