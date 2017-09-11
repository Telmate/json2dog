# json2dog

Send JSON data from a URL to datadog.

* [Supported Platforms](#supported-platforms)
* [Usage](#usage)
* [Dependencies](#dependencies)
* [Sample Results](#sample_results)
* [Authors](#authors)

## Supported Platforms <a name="supported-platforms"></a>

* Ubuntu or CentOS

## Usage <a name="usage"></a>

	cd lib
	export PERL5LIB=`pwd`
	cd ..
	./json2dog health_url statsd_base

where

* `health_url` is a JSON end point that returns stats we should graph
* `statsd_base` is the start of the metric name that should be sent to datadog

## Dependencies <a name="dependencies"></a>

* Perl 5
* Perl module [DataDog::DogStatsd](https://github.com/binary-com/dogstatsd-perl) 
* Perl module JSON
* Perl module LWP::UserAgent

The two standard Perl modules mentioned above can be installed my running
[`prereq.sh`](prereq.sh).

## Sample Results <A name="sample_results"></a>

![example 1](img/json2dog_example1.png)

## Authors <a name="authors"></a>

* Christopher Hicks <chicks@telmate.com>
