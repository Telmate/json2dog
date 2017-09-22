# init scripts for json2dog

These scripts are here to go into `/etc/init.d/json2dog`:

* [`json2dog.ubu14`](json2dog.ubu14) is for Ubuntu 14.04 LTS.
[`etc_default_json2dog.ubu14`](etc_default_json2dog.ubu14) goes in `/etc/default/json2dog`.
* [`json2dog.cent7`](json2dog.cent7) is for Red Hat Enterprise Linux 7 and CentOS 7

They assume that `json2dog` is in `/opt/json2dog/json2dog` with the Perl modules in
`/opt/json2dog/lib` (which gets set in `PERL5LIB`.

## Configuration

Configure these settings in `/etc/default/json2dog`:

* `JSON2DOG_URL` is the URL for the JSON end point to scrape every minute.  Defaults to
[https://jsonplaceholder.typicode.com/posts/1](https://jsonplaceholder.typicode.com/posts/1).
* `JSON2DOG_BASE` is the base for the metric names to be sent to dogstatsd.  The key name from the JSON will
be appended to this to form the full metric name used.
* `JSON2DOG_LOG`  is the filename where logs will be written
* `DOGSTATSD_PORT` is the port that dogstatsd is listening on.  Default is to see if 8125 or 1025 is
listening.
* `JSON2DOG_DEBUG` will enable debug mode.  Setting to 1 enables basic debugging.  Setting to 2 includes
more details
* `RUNASUSER` will set the user to run as
* `HOSTNAME` will set the hostname in logging output
