# Fluent::Plugin::Sadf, a plugin for [Fluentd](http://fluentd.org)

fluentd plugin for collecting sysstat using sadf.

This plugin needs "sysstat".

## Installation

    $ gem install fluent-plugin-sadf

## Configuration
### Parameters:

TBD

### Example:

    <source>
        type              sadf
        sar_option        -A
        tag               sadf.tag
        interval          10
        hostname_output   true
        hostname          check_host01
    </source>

output

    sadf.tag: {"hostname":"note","args":"-A","all":{"%usr":"26.14","%nice":"0.00","%sys":"7.95","%iowait":"1.96","%steal":"0.00","%irq":"0.00","%soft":"0.00","%guest":"0.00","%gnice":"0.00","%idle":"63.94"},"cpu0":{"%usr":"21.40","%nice":"0.00","%sys":"8.73","%iowait":"3.93","%steal":"0.00","%irq":"0.00","%soft":"0.00","%guest":"0.00","%gnice":"0.00","%idle":"65.94"},"cpu1":{"%usr":"35.81","%nice":"0.00","%sys":"9.61","%iowait":"2.18","%steal":"0.00","%irq":"0.00","%soft":"0.00","%guest":"0.00","%gnice":"0.00","%idle":"52.40"},"cpu2":{"%usr":"21.40","%nice":"0.00","%sys":"6.55","%iowait":"1.75","%steal":"0.00","%irq":"0.00","%soft":"0.00","%guest":"0.00","%gnice":"0.00","%idle":"70.31"},"cpu3":{"%usr":"25.97","%nice":"0.00","%sys":"6.93","%iowait":"0.00","%steal":"0.00","%irq":"0.00","%soft":"0.00","%guest":"0.00","%gnice":"0.00","%idle":"67.10"}}

## Copyright

Copyright (c) 2016 Yuji Hagiwara. See [LICENSE](LICENSE.txt) for details.

This software is based on fluent-plugin-sar (https://github.com/hirotaka-tajiri/fluent-plugin-sar) written by Hirotaka Tajiri, licensed by MIT License.

