# Home Server Image

This repository defines a **personal server OS image** built on top of `fedora-bootc`, targeting a single-node, bare‑metal home server. The image is intentionally opinionated and tightly scoped: it exists primarily as a learning exercise in bootable containers, and secondarily as a practical way to manage my own home server.

The system is designed to run **containerized workloads only**, with the host OS treated as an immutable, versioned artifact. All services I want deployed are built directly into the image, allowing the entire system state to be upgraded or rolled back atomically.

This image is not particularly suitable for use by others, but is instead published mainly so others can inspect, learn from, or draw inspiration from the configuration, in the same way I have benefited from being able to reference setups others have previously shared.


## Motivation

This project grew out of two related motivations:

1. **Learning bootable containers in practice.** Bootable containers are an exciting and developing technology, but I'm not especially familiar with them in practice, so building and administering a real system based on a bootable container will allow me to gain a better understanding of how it works and what trade-offs are made.
2. **Reducing friction compared to my previous NixOS setup.** While NixOS is powerful and conceptually elegant, I've run into friction more often than I'd like when deploying or experimenting with software that was not already packaged or easy to package myself.
By comparison, containerized deployment is well-supported by many applications, and is often even the application's most recommended deployment method, so by using a system built around containers but still ultimately built from a version-controlled definition, I get considerably reduced friction while keeping many of the same benefits I got from NixOS:

    - A single, versioned artifact representing the entire system
    - Trivial redeployment and updating of the full server
    - Reliable rollbacks


## Non-Goals

This project is **not** intended to:

- Serve as a reusable base image for others
- Support arbitrary runtime customization or configuration
- Act as a distribution, framework, or platform

If you are looking for a flexible or readily deployable bootc image and you are not seeking to run *exactly* the same suite of services I am, you will likely be much better off building directly on top of `fedora-bootc` and only referencing this repo for configuration examples.


## Project Status and Roadmap

Current status:

- **Heavily** work-in-progress.
- Experimental and currently deployed only to a VM
- Single-user (me)
- Subject to breaking changes without notice

A basic roadmap exists in the form of [my project TODO list][TODO].

[TODO]: https://github.com/rjgraffham/bootc-server/blob/main/TODO.md