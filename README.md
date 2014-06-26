Description
===========

opsworks_env - Chef cookbook to set environment variables on servers on Amazon's OpsWorks platform

Configuration values are specified in the [stack's custom JSON](http://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-json.html). Example:

    {
      "custom_env": {
        "my_app": {
          "FOO": "http://www.yahoo.com",
          "BAR": "1001"
        }
      },

This will result in a file /etc/profile.d/custom_env.sh like this:

    FOO=http://www.yahoo.com
    BAR=1001

Opsworks Set-Up
---------------

The `opsworks_env::default` recipe should be added as a custom recipe to the _Configure_ and _Deploy_ events.



