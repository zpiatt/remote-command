# Remote Command
<p align="left">
<a href="./LICENSE.md"><img src="https://img.shields.io/github/license/zpiatt/remote-command"></a>
</p>

Remote Command (rc) is a command line system administration remote management tool written in `bash 4.2+`.

### Recently added:
  - Added `-f` option to specify host file.
  - Added `-i` option to filter host list with `ICMP`.
  - Added `-p` option to filter host list by attempting `tcp` handshakes on specified port.
  - Added `-t` option to filter host list by attempting `tcp` handshakes on port `22`.
  - Added `-u` option to specify username.

### Upcoming features:
  - Still getting the idea on paper. I'll make a release when this is ready for install.
  - Planning to add a `-l` option to simply print matching hosts and exit.
  - Planning to add a `-r` option to pass regrex to filter host names.
    - Also, adding `/` to search long host lists similar to `less`

### More:
