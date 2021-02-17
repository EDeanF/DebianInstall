# Partitioning and Backup

-fdisk
-rsync


# Building from Source

## Explanation

One day you are likely to need code that is not easily managed by `apt`. This will likely require you to install software yourself. However, installing software in linux is a much more involved process. If you are lucky, the software is provided as a `.deb` file. If so, then your software can still be installed with `apt` if you are on a Debian-based OS. However, it is more common that the software will be provided as a tarball, which uses the extention `.tar.gz` or `.tgz`. This tarball (once decompressed and unpacked) contains the source code. That is, it contains human readable code (source code) that needs to be compiled into binary/machine code. The process of compiling the source code into binary/machine code is what is meant by the phrase "building from source."

I'll also note briefly that even if the software can be installed with a `.deb` file, there are advantages to compiling from source, namely that you have more control and, consequently, may be able to debug problems more easily once you learn how. Unfortunately, building code from source is complicated primarily for two reasons:

1. The compilation process may have to be configured by hand. This is primarily a function of the quality of the installation process (i.e. how much effort the authors made to make the installation process clear and straightforward) and how "standard" your installation of linux is.

2. You need to manage the dependencies yourself. That is, the source code likely depends on other code. This "other code" is may be referred to as binaries or header files, but that just means that this "other code" must already have been compiled into binary and with associated header files.

These two problems are related, but the first problem is more immediately visible, so we will tackle that first.

## How to build from source

Building from source typically requires a couple steps.

1. Decompressing and unpacking the tarball. This is usually achieved by something like `tar -xzf filename.tar.gz`. You may have to change the tags depending on the compression format.

2. Read the `README` and `INSTALL` files. These will usually contain instructions for how to compile the source code.

3. Run `configure --prefix="path"`. This configures the Makefile, which provides instructions for how to compile the source code. For example, you can choose what compiler to use. The configure file describes options provided by the author to configure the Makefile. At the bare minimum, you will likely have the option to choose the location of the installation. This location is called --prefix, because the compilation process will create files in multiple directories (such as bin, lib, etc), but all of these directories will be relative to the prefix. The default prefix is often set to `/usr/local`. Another common choice is `--prefix=/opt/package-name`. [Additional reading](https://en.wikipedia.org/wiki/Configure_script)

4. You may need to configure the compilation process for your particular setup if the `configure` file is not enough. This is done by manually editing the Makefile.

5. Run `make`. This follows the instructions in Makefile to compile the source code. [Additional reading](https://en.wikipedia.org/wiki/Make_(software))

6. Run `make install` or `make altinstall`. This can also perform some compilation, but typically it will just move the files to the appropriate location, as specified by `--prefix`, for example. `altinstall` will typically just move the files and not set up aliases and links for you to access the binaries. This is useful when install multiple versions of the same code. Effectively, `install` will make that version the default one.

I think installing binaries in the home directory is safest, if possible. It makes uninstallation easy; you simply remove the directory where you compiled the software.

If you choose to install it somewhere other than `/usr/local`, you will likely have to add the directory to your PATH environment variable. This can be done by adding a line to `~/.bashrc`, which is a file in your home directory. This line should look something like `PATH="/opt/packagename/bin:$PATH"`.

## Example of building from source

```
tar -xzf Python3.7.9.tar.gz
cd Python3.7.9
configure --prefix="$HOME/usr/python3.7"
make
make test
make altinstall
```

## Dependency hell

Thus far, we have only really addressed the first problem, namely how to configure the compilation process. But as mentioned earlier, there is a second challenge which is to make sure all the dependencies are properly installed *before* you even attempt to compile the source code. 

I am not that familiar with this process, and so cannot say much more. However, there is one important trick to be aware of. If the package you are trying to install has a version in the Debian repositories, most of the time you can ask Debian to install all the dependencies for you. In other words, if it is possible for you to install the package using `apt-get`, but for some reason you would like to build from source instead (because the version in the repository is outdated, for example), what you can do *before* you build from source is run `apt-get build-dep package-name`. This will install the dependencies for the Debian version of the package, which are likely to be the same dependencies of your version. 

Unfortunately, this can only get you so far. If the dependencies in the Debian repositories are also outdated, you will likely have to build *those* from source as well. It is also possible for the dependencies not to be in the Debian repository, although if this is the case it is unlikely you can use the `apt-get build-dep` trick anyway. As alluded to above, how easy a package is to install is a function of how many and complex the dependencies are and how well documented they are by the authors. [Additional reading](https://en.wikipedia.org/wiki/Dependency_hell)

If the dependencies are commonly found in most Linux systems, the authors may write the Makefile to check that presence of the dependencies and through an error if they are not found. However, if the software depends on less common or proprietary software, you will have to explicitly download these dependencies yourself. Depending how you install the dependencies and where you place them in your filesystem, you may have to explicitly tell the compiler where to find the dependencies. 

# Managing Hardware and Linux Kernel

## Filesystem

The filesystems associated with hardware are called virtual file systems because there are no actual files. They are linked to kernel data structures.

-`dev`: device files
-`/proc`: process and kernel information files
-`/sys`: the more modern version of /proc. Control of hardware is sometimes achieved by editing files here.

## Commands

-`uname -a`: print all system information

-`top`, `htop`, `atop`: view processes

-`lshw`: lists hardware
-`lspci -v`: lists pci devices
-`lscpu`: lists cpu information
-`lsblk`: lists block devices such as hard disks, flash drives, etc
-`lsusb`: lists usb 
-`lsscsi`: list scsi/sata devices

-`/var/log/kernel.log`: kernel logs
-`dmesg | tail -10`: command line tool to spit out kernel logs
-`dmidecode`: DMI table decoder
