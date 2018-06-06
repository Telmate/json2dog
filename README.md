# json2dog

Send JSON data from a URL to datadog.

* [Supported Platforms](#supported-platforms)
* [Usage](#usage)
* [Dependencies](#dependencies)
* [Sample Results](#sample_results)
* [Support](#support)
* [Authors](#authors)

## Supported Platforms <a name="supported-platforms"></a>

* Ubuntu or CentOS

## Usage <a name="usage"></a>
	# to get our copy of DataDog::DogStatsd
	cd lib
	export PERL5LIB=`pwd`
	cd ..

	./json2dog kafkaconnect_url statsd_base commaseperated_kafkaconnectips

where

* `kafkaconnect_url` is a URL to a JSON end point that returns stats we should graph
* `statsd_base` is the start of the metric name that should be sent to datadog

Options can be set by setting environment variables:

	# set port for dogstatsd (optional)
	export DOGSTATSD_PORT=8125

	# enable debug mode
	export JSON2DOG_DEBUG=1

	# log to a file
	export JSON2DOG_LOG=/var/log/json2dog.log

	./json2dog kafkaconnect_url statsd_base commaseperated_kafkaconnectips

Example:

  ./json2dog http://HOSTNAME:8083/connectors/<connectorname>/status tm.debezium kafka-esb-app1-bri.telmate.cc,kafka-esb-app2-bri.telmate.cc,kafka-esb-app3-bri.telmate.cc &

Other options are used by the [init scripts](init.d/) and are documented [here](init.d/).

## Dependencies <a name="dependencies"></a>

* Perl 5
* Perl module [DataDog::DogStatsd](https://github.com/binary-com/dogstatsd-perl) is included
* Perl module JSON
* Perl module IO::Handle (core module)
* Perl module IO::Socket::SSL
* Perl module LWP::UserAgent

The two standard Perl modules mentioned above can be installed my running
[`prereq.sh`](prereq.sh).

## Sample Results <A name="sample_results"></a>

![example 1](img/json2dog_example1.png)

## Support <a name="support"></a>

Please file tickets via [github issues](https://github.com/Telmate/json2dog/issues).

You may find the [CHANGELOG](CHANGELOG.md) helpful.

