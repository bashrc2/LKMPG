# The Linux Kernel Module Programming Guide

Link to the [ebook](lkmpg.epub)

This is a project to keep the kernel module programmer's guide up to date, with working examples for recent kernel versions. The guide has been around since 2001 and most copies of it on the web only describe old 2.6.x kernels.

The text is in Emacs org-mode format with embedded C code examples, also exported in html format for convenient viewing.

The original guide may be found at http://www.tldp.org/LDP/lkmpg/

French translations for kernel 4.15.2 by Stéphane Burel.

Install the kernel header files on Arch/Parabola:

``` bash
sudo pacman -S linux-libre-headers
```

Then extract and compile the examples:

``` bash
cd [version directory]
./create_examples.sh
cd examples
make
```

![Book cover](cover.png)

![Book back](back.png)
