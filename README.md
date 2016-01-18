# Yum Plugins Module
[![Build Status](https://travis-ci.org/Adaptavist/puppet-yum_plugins.svg?branch=master)](https://travis-ci.org/Adaptavist/puppet-yum_plugins)

## Overview

The **Yum Plugins** module enables by default fastestmirror yum plugin. It allows you to specify yum plugins on global level and per host.

##Hiera Examples:

* Global Settings

        # setting on global level
        yum_plugins::plugins:
            'plugin1':
              source: 'url_to_plugin1'
        
* Global and Host Settings example
```
        #setting on global level
        yum_plugins::plugins:
            'plugin1':
              source: 'url_to_plugin1'
        hosts:
            'host1':
                #disable global plugins for this host
                knod_config::merge_plugins false
                #blacklist amd76x_edac module
                yum_plugins::plugins:
                    'plugin2':
                      source: 'url_to_plugin2'
```
## Dependencies

This module has the following dependencies:

* example42/yum