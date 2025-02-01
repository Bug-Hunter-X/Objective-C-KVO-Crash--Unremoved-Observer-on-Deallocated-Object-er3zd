# Objective-C KVO Crash: Unremoved Observer on Deallocated Object

This repository demonstrates a common bug in Objective-C related to Key-Value Observing (KVO). The bug occurs when an observer is not properly removed before the observed object is deallocated, leading to crashes.

## Bug Description
The `KVO_Bug.m` file contains code that registers an observer but fails to remove it.  This causes a crash when the observed object is deallocated because the observer attempts to send messages to a deallocated object.

## Solution
The `KVO_Solution.m` file provides a corrected version of the code.  It demonstrates the proper way to handle KVO by removing observers in the `-dealloc` method or when the observation is no longer needed.