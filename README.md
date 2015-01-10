# NodeBots Vagrant image

Some operating systems make it harder than it needs to be to running the more esoteric parts of the NodeBots stack.

Some users of these operating systems are experts and don't need help, but for everyone else we've found it easier to provide a pre-setup VM with all the necessary dependencies already installed.  This used to be on a USB stick which was slow and resource constrained, here is the same thing presented as a Vagrant image.

## Prequisites

1. Install [Vagrant](https://www.vagrantup.com/downloads.html)
1. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and the Extension Pack
1. Clone this repo

  ```sh
  $ git clone http://github.com/tableflip/nodebots-vm
  ```
1. cd into the repo directory

  ```sh
  $ cd nodebots-vm
  ```
1. Connect to your image

  ```sh
  $ vagrant up
  ```
  
  After a few minutes you should be able to log in and start the GUI
  
  ```sh
  $ vagrant ssh
  ...
  vagrant@packer-virtualbox-iso:~$ startx
  ```

When you wish to shut the VM down, log out from it and run:

```sh
$ vagrant destroy
```

## Attaching an Arduino

Once you have installed Vagrant and started the VM you need to ensure that VirtualBox and not the host OS will have access to the Arduino once plugged in:

1. Attach the Arduino via USB
1. In VirtualBox, select `Machine` > `Settings` > `Ports` > `USB`
1. Click the `Add filter` button with the small green + icon
1. Select your Arduino from the list
1. Disconnect and reconnect the Arduino - you should see it appear in the VM at `/dev/ttyACM0` or similar

## Running Johnny-Five

Now that Vagrant, VirtualBox and your Arduino are set up:

1. Select `Applications` > `Web Browser` to start Chromium
1. Choose `Apps` from the Bookmark Bar
1. Choose `Johnny-Five Chrome`
1. Ensure that the correct port is selected
1. If it's the first time you've connected an Ardunio, select `Install Firmata`
1. Enter your code and click `Run`

## Troubleshooting

If running `vagrant up` leaves you with an error message like:

> The guest machine entered an invalid state while waiting for it
> to boot. Valid states are 'starting, running'. The machine is in the
> 'poweroff' state. Please verify everything is configured
> properly and try again.

Then double check that you installed the [VirtualBox Extension Pack](https://www.virtualbox.org/wiki/Downloads) for your platform.

