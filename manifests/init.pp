class yum_plugins(
    $plugins = {
        'fastestmirror' => {
            'source' => 'puppet:///modules/yum_plugins/fastestmirror.conf',
        }
        },
    $merge_plugins = 'true',
    ) {

    if ($host != undef) {
        #if so validate the hash
        validate_hash($host)
        #if a host level "merge_plugins" flag has been set use it, otherwise use the global flag
        $real_merge_plugins = $host['yum_plugins::merge_plugins']? {
            default => $host['yum_plugins::merge_plugins'],
            undef => $merge_plugins,
        }
        #check if there is a host level load list is defined
        if ($host['yum_plugins::plugins']) {
            validate_hash($host['yum_plugins::plugins'])
            #if so and we have merging emabled merge global and host values
            if ($real_merge_plugins) {
                $real_plugins=merge($plugins,$host['yum_plugins::plugins'])
            }
            #if merging is disabled use the host values
            else {
                $real_plugins=$host['yum_plugins::plugins']
            }
        } else {
            $real_plugins=$plugins
        }
    } else {
        $real_plugins=$plugins
    }

    #if the load list is set create then
    if ($real_plugins) {
        validate_hash($real_plugins)
        create_resources(yum::plugin, $real_plugins)
    }
}
