# Description:
#   A hubot script for managing DNS A-records via the Dynect API.
#
# Commands:
#   hubot dns create <fqdn> <ip> - Create a new DNS record.
#   hubot dns remove <fqdn> <ip> - Remove an existing DNS record.
#   hubot dns update <fqdn> <ip> - Update an existing DNS record.
#   hubot dns [list]             - List all DNS records.
#
# Author:
#   patcon@myplanetdigital

module.exports = (robot) ->
  REGEX = ///                                  # match) note
    dns                                        #    root command
    \s+                                        #    whitespace
    (                                          # 1) commmand
      add
    | remove
    | update
    | list
    )?
    (                                          # 2)
      \s+                                      #    whitespace
      (?:(?:f|ht)tps?://)?([^/:]+)             # 3) fqdn
      \s+                                      #    whitespace
      (\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b) # 4) ip address
    )?
  ///i

  robot.respond REGEX, (msg) ->
    command = msg.match[1]
    fqdn    = msg.match[3]
    ip      = msg.match[4]
    msg.send "command: #{command}, fqdn: #{fqdn}, ip: #{ip}"


