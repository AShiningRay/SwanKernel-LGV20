# SwanKernel for the LG V20

SwanKernel is an android kernel based on the latest Lineage OS 18.1 sources for the V20, aiming to bring those features and updates and improve them with some extra tuning, fixing and external features tailored specifically for the LG V20.

### Which phone variants/models does this kernel support?

This kernel supports the following models for now:

* `H910/H915`
* `H918`
* `H990`
* `LS997`
* `US996`
* `VS995`

But support for other variants of some models like the H990 will be coming at a later date.

### What does this kernel try to achieve?

The main goal here is to have a kernel that not only has extra features and improvements, but is also clean and concise, having only features that are truly needed from a kernel that will run alongside a Android 11-based ROM. One example of that is Kcal display control, a feature that is unnecessary here since most, if not all Android 11 ROMs have LiveDisplay for that exact same purpose, and without the need to root. 
This helps the kernel have a small overhead and file size, as well as promote better maintainability, because i'm still a complete newbie when it comes to kernel development and compilation.

This kernel does have a battery life bias, but will still scale up to maximum performance when needed. No Overclocking is done, for now at least.

### Does it have any features over a stock kernel?

Yes, here's a list of features that both kernel variants have over stock:

1. AdrenoBoost for improved GPU performance.
2. GPU and CPU Undervolt for better power efficiency on load.
3. CPU governors tuned for better battery life and thermal stability without impacting performance all that much.
4. Almost no unnecessary debug flags on the kernel, minimizing its size and overhead.
5. Westwood TCP Congestion Algorithm set as default in order to have better network performance and consistency.
6. AutoSMP CPU Hotplug to shutdown the big cores when their stronger performance isn't needed, slightly improving battery life on light loads and idle.
7. Disabled CPU Boost when a finger is detected on screen, preventing unnecessary frequency boosts when no meaningful action is done other than tapping on screen and slightly scrolling around. We have Schedutil to keep it smooth anyways.
8. USB Fast Charge.
9. Multiple cherry-picks from different msm8996 sources with fixes and improvements to the kernel.
10. Configurable wakelock blocker (boeffla) for roms that have some "unneeded" wakelocks enabled by default and/or users that know which wakelocks can be blocked for better battery life.
11. Dynamic FSync, giving better IO performance in general and a massive boost to random writes without compromising data integrity by outright disabling FSync.
12. Anxiety IO Scheduler enable by default, offering a read bias and lower latency in IO opeaions.

As for the `UVExtreme` variant, it has the following features as well:

1. Stronger Undervolts (i'm talking about borderline unstable undervolts here).
2. CPU Voltage Control if you need to setup a custom undervolt to keep it more stable and have no need to compile the kernel from source just to change the values... and that's assuming your phone even boots with this variant of the kernel.
3. Disabled Battery BCL, eliminating power throttling caused by the battery, just be careful when running demanding tasks while having almost no battery left.

### Great, but can i compile it from source if i need to?

Of course, i will write a guide on how to compile this kernel soon ;)

### Are there any major bugs?

For now, there is one critical bug to be fixed ASAP: The phone's Bluetooth, at least on my H910, isn't working at all. That problem is definitely located in the kernel, since it happens on different Android 11 ROMs like the Lighthouse LG V20(the one i'm personally using), Lineage OS 18.1 and Superior OS Xcalibur ROMs.

Besides that, there's also the dreaded Infrared Blaster, and it... works? The IR is able to send the very first command i give to my LG TV without any problems after every reboot, but refuses to send anything else after that first command. The IR Blaster's light still works all the time though, despite having some big delays between on/off states.

### Do you have anyone to thank for?

I do, a lot of people initially:

* My family for supporting me through my entire journey inside and outside of programming.
* My teachers at UFCAT's Computer Science course, since they are the ones who helped me achieved my current level of knowledge to be able to mess with kernels.
* My friends because of their really diverse interests that eventually helped me decide on what i actually want to do with computers in general.

And with that out of the way, i get to thank the people that helped me with this kernel, even if indirectly, so... a lot more people:
* lybxlpsv for his customized kernel and general knowledge about the phone's performance posted on XDA Developers.
* xxseva for his amazing Lighthouse V20 ROM, which is the main testbed for this kernel.
* The entire Lineage OS staff, as well as the guys keeping the V20 kernel source alive and updated.
* Linus Torvalds, since he was and still is the foundation block of pretty much everything here.
* flar2, tbalden and acuicultor for the implementation and improvement of the AdrenoBoost feature on oneplus 8 radioactive kernel, from which i ported it.
* engstk and AnGglt88 for the usb fastcharge implementation.
* osm0sis for his AnyKernel3.
* andip71 and his generic implementation of a wakelock blocker.
* tytydraco for the Anxiety IO Scheduler.
* And anyone else that i may have forgot, especially those i cherry-picked from.
