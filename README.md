# HAL Testing CI Example

## What it is

This repository serves as an example of how you can run automated tests on an emulated processor in cloud environments using Docker and Qemu.  Qemu allows us to emulate a processor, such as one that is found in a microcontroller, inside of Docker.  So we can run tests against our business logic running on an emulated processor that mimics our embedded system's processor.

## Run locally

```
git submodule update --init

make docker-build-and-test
```

that's it!

This should work on Mac and Linux systems with Docker installed.
