# Test Steps

## Table of Contents

* [Introduction](#introduction)
* [Test Step Summary](#test-step-summary)
* [Details](#details)
  * [assert_window_wize](#assert_window_wize)
  * [set_window_wize](#set_window_wize)


## Introduction

This plugin provides a few new [Test Steps](https://github.com/peiffer-innovations/automated_testing_framework/blob/main/documentation/STEPS.md) related to test connectivity related actions.


---

## Test Step Summary

Test Step IDs                             | Description
------------------------------------------|-------------
[assert_window_wize](#assert_window_wize) | Asserts that the width and height of the application's window size is a specific value.
[set_window_wize](#set_window_wize)       | Sets the window size of the application, fails when not running as a native desktop app.


---
## Details


### assert_window_wize

**How it Works**

1. **Note**: The values are device independent pixels, so on high resolution devices, a screenshot may actually be a multiple of these values.
2. Checks to see if the `width` and `height` match the actual size of the window.


**Example**

```json
{
  "id": "assert_window_wize",
  "image": "<optional_base_64_image>",
  "values": {
    "height": 768,
    "width": 1024
  }
}
```

**Values**

Key      | Type    | Required | Supports Variable | Description
---------|---------|----------|-------------------|-------------
`height` | double  | Yes      | Yes               | The expected height of the window.
`width`  | double  | Yes      | Yes               | The expected width of the window.


---

### set_window_wize

**How it Works**

1. **Note**: The values are device independent pixels, so on high resolution devices, a screenshot may actually be a multiple of these values.
2. Sets the `width` and `height` of the application's window.


**Example**

```json
{
  "id": "set_window_wize",
  "image": "<optional_base_64_image>",
  "values": {
    "height": 768,
    "width": 1024
  }
}
```

**Values**

Key      | Type    | Required | Supports Variable | Description
---------|---------|----------|-------------------|-------------
`height` | double  | Yes      | Yes               | The height of the window.
`width`  | double  | Yes      | Yes               | The width of the window.


