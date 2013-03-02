[![Build Status](https://travis-ci.org/exempla/dorb.png)](https://travis-ci.org/exempla/dorb)
[![Code Climate](https://codeclimate.com/github/exempla/dorb.png)](https://codeclimate.com/github/exempla/dorb)

# DORB - Digital Ocean Ruby Bindings

Interact with the [Digital Ocean](http://www.digitalocean.com) [API](http://www.digitalocean.com/api) in an idiomatic ruby way.

DORB exposes the Digital Ocean API as Ruby objects, has 100% test coverage and supports the entire API.

## Installation

Add this line to your application's Gemfile:

    gem 'dorb'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dorb

## Usage

Require the library in your code as

    require 'dorb'

## Configuration

Set your client key and API key

    # This should be in an initializer or similar
    DORB::Config.setup \
      :client_key => 'YOUR_CLIENT_KEY_HERE',
      :api_key => 'YOUR_API_KEY_HERE'

Any method that calls the Digital Ocean API will raise DORB::ConfigurationError if either Client Key or API Key are not configured

## Getting Started

### Droplets

##### Show all active droplets
This method returns all active droplets that are currently running in your account.

    DORB::Droplet.all

##### Show droplet
This method returns a droplet for a specific droplet id.

    DORB::Droplet.find id

#####  New droplet
This method allows you to create a new droplet.

    DORB::Droplet.new :name => name, :size => size, :image => image, :region => region, :ssh_keys => [keys]

##### Reboot droplet
This method allows you to reboot a droplet. This is the preferred method to use if a server is not responding

    droplet.reboot

##### Power cycle droplet
This method will turn off the droplet and then turn it back on

    droplet.power_cycle

##### Shut down droplet
This method allows you to shutdown a running droplet. The droplet will remain in your account

    droplet.shutdown

##### Power off droplet
This method allows you to power off a running droplet. The droplet will remain in your account

    droplet.power_off

##### Power on droplet
This method allows you to power on a powered off droplet

    droplet.power_on

##### Reset root password
This method will reset the root password for a droplet. Please be aware that this will reboot the droplet to allow resetting the password.

    droplet.password_reset

##### Resize droplet
This method allows you to resize a specific droplet to a different size. This will affect the number of processors and memory allocated to the droplet.

    droplet.resize size

##### Take a snapshot
This method allows you to take a snapshot of the running droplet, which can later be restored or used to create a new droplet from the same image. Please be aware this may cause a reboot.

    droplet.snapshot

##### Restore droplet
This method allows you to restore a droplet with a previous image or snapshot. This will be a mirror copy of the image or snapshot to your droplet. Be sure you have backed up any necessary information prior to restore.

    droplet.restore image

##### Rebuild droplet
This method allows you to reinstall a droplet with a default image. This is useful if you want to start again but retain the same IP address for your droplet.

    droplet.rebuild image

##### Enable automatic backups
This method enables automatic backups which run in the background daily to backup your droplet's data.

    droplet.enable_backups

##### Disable automatic backups
This method disables automatic backups from running to backup your droplet's data.

    droplet.disable_backups

##### Destroy droplet
This method destroys one of your droplets - this is irreversible.

    droplet.destroy

### Regions

##### All Regions
This method will return all the available regions within the Digital Ocean cloud.

    DORB::Regions.all

### Images

##### All images
This method returns all the available images that can be accessed by your client ID. You will have access to all public images by default, and any snapshots or backups that you have created in your own account.

    DORB::Image.all

##### Find image
This method returns an image instance

    DORB::Image.find name

##### Destroy image
This method allows you to destroy an image. There is no way to restore a deleted image so be careful and ensure your data is properly backed up.

    image.destroy

### SSH Keys

##### All SSH keys
This method lists all the available public SSH keys in your account that can be added to a droplet.

    DORB::SSHKey.all

##### Find SSH key
This method returns an SSHKey instance

    DORB::SSHKey.find name

##### Add SSH key
This method allows you to add a new public SSH key to your account.

    DORB::SSHKey.add name, ssh_key_pub

##### Edit SSH key
This method allows you to modify an existing public SSH key in your account.

    ssh_key.edit ssh_key_pub

##### Destroy SSH Key
This method will delete the SSH key from your account.

    ssh_key.destroy

### Sizes

##### All Sizes
This method returns all the available sizes that can be used to create a droplet.

    DORB::Size.all


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
