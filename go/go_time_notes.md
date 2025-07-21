# Go Time Package Documentation

The `time` package in Go provides functionality for measuring and displaying time, including handling dates, durations, timers, and time zones. This document outlines the key features, types, and usage examples of the `time` package.

## Overview

The `time` package is part of the Go standard library and is used for:
- Representing and manipulating time instances (`time.Time`).
- Working with durations (`time.Duration`).
- Handling time zones and locations.
- Creating timers and tickers for scheduling tasks.
- Formatting and parsing time strings.

To use the package, import it in your Go program:

```go
import "time"
```

## Key Types

### `time.Time`
Represents a specific point in time with nanosecond precision. It includes a date, time, and location (time zone).

### `time.Duration`
Represents a duration of time (e.g., nanoseconds, seconds, hours) as an `int64` count of nanoseconds.

### `time.Location`
Represents a time zone, such as UTC or a specific geographic location (e.g., "America/New_York").

### `time.Timer` and `time.Ticker`
Used for scheduling tasks:
- `Timer`: Executes a task once after a specified duration.
- `Ticker`: Executes a task repeatedly at specified intervals.

## Common Functions and Methods

### Creating and Getting Time
- `time.Now() time.Time`: Returns the current time.
- `time.Date(year, month, day, hour, min, sec, nsec int, loc *Location) time.Time`: Creates a `time.Time` for a specific date and time.
- `time.Unix(sec int64, nsec int64) time.Time`: Creates a time from Unix timestamp.

Example:
```go
now := time.Now()
specificTime := time.Date(2025, time.July, 17, 14, 47, 0, 0, time.UTC)
unixTime := time.Unix(1626362820, 0)
```

### Time Manipulation
- `time.Time.Add(d Duration) Time`: Adds a duration to a time.
- `time.Time.Sub(t Time) Duration`: Computes the duration between two times.
- `time.Time.AddDate(years, months, days int) Time`: Adds years, months, and days.

Example:
```go
t := time.Now()
future := t.Add(24 * time.Hour) // Add 1 day
duration := time.Now().Sub(t)   // Time elapsed since t
```

### Formatting and Parsing
- `time.Time.Format(layout string) string`: Formats a time using a layout string (e.g., `time.RFC3339`).
- `time.Parse(layout, value string) (Time, error)`: Parses a time string into a `time.Time`.

Common layout constants:
- `time.RFC3339`: `"2006-01-02T15:04:05Z07:00"`
- `time.ANSIC`: `"Mon Jan _2 15:04:05 2006"`

Example:
```go
t := time.Now()
formatted := t.Format(time.RFC3339) // e.g., "2025-07-17T14:47:00Z"
parsed, err := time.Parse(time.RFC3339, "2025-07-17T14:47:00Z")
if err != nil {
    // Handle error
}
```

### Time Zones
- `time.LoadLocation(name string) (*Location, error)`: Loads a time zone (e.g., "America/New_York").
- `time.FixedZone(name string, offset int) *Location`: Creates a time zone with a fixed offset (in seconds).

Example:
```go
loc, err := time.LoadLocation("America/New_York")
if err != nil {
    // Handle error
}
t := time.Now().In(loc) // Convert time to New York time zone
```

### Durations
Durations are represented as `time.Duration`, with predefined constants like `time.Nanosecond`, `time.Microsecond`, `time.Millisecond`, `time.Second`, `time.Minute`, and `time.Hour`.

Example:
```go
d := 5 * time.Second + 300 * time.Millisecond
fmt.Println(d) // Output: 5.3s
```

### Timers and Tickers
- `time.Sleep(d Duration)`: Pauses execution for the specified duration.
- `time.NewTimer(d Duration) *Timer`: Creates a timer that triggers after a duration.
- `time.NewTicker(d Duration) *Ticker`: Creates a ticker that triggers repeatedly.

Example:
```go
// Sleep for 2 seconds
time.Sleep(2 * time.Second)

// Timer: execute once after 1 second
timer := time.NewTimer(time.Second)
<-timer.C
fmt.Println("Timer fired")

// Ticker: execute every 500ms
ticker := time.NewTicker(500 * time.Millisecond)
go func() {
    for range ticker.C {
        fmt.Println("Tick")
    }
}()
```

## Example Program

Here's a complete example demonstrating various features of the `time` package:

```go
package main

import (
    "fmt"
    "time"
)

func main() {
    // Current time
    now := time.Now()
    fmt.Printf("Current time: %v\n", now)

    // Format time
    formatted := now.Format(time.RFC3339)
    fmt.Printf("Formatted time: %s\n", formatted)

    // Parse time
    t, err := time.Parse(time.RFC3339, "2025-07-17T14:47:00Z")
    if err != nil {
        fmt.Println("Error parsing time:", err)
        return
    }
    fmt.Printf("Parsed time: %v\n", t)

    // Time zone conversion
    loc, err := time.LoadLocation("America/New_York")
    if err != nil {
        fmt.Println("Error loading location:", err)
        return
    }
    nyTime := now.In(loc)
    fmt.Printf("New York time: %v\n", nyTime)

    // Duration
    duration := 2*time.Hour + 30*time.Minute
    future := now.Add(duration)
    fmt.Printf("Time after %v: %v\n", duration, future)

    // Timer example
    timer := time.NewTimer(2 * time.Second)
    <-timer.C
    fmt.Println("Timer completed after 2 seconds")
}
```

## Important Notes
- **Monotonic Time**: `time.Now()` includes a monotonic clock reading to ensure accurate duration calculations, especially for measuring elapsed time.
- **Thread Safety**: Most `time` package functions are safe for concurrent use, but be cautious with shared `Timer` or `Ticker` instances.
- **Time Zone Database**: The `time` package relies on the system's time zone database or the `$GOROOT/lib/time/zoneinfo.zip` file for time zone information.
- **Constants**: Use predefined constants like `time.RFC3339` for consistent formatting.

## Additional Resources
- Official Go Documentation: [time package](https://pkg.go.dev/time)
- Go Time Layout Reference: [time layout constants](https://pkg.go.dev/time#pkg-constants)
- IANA Time Zone Database: Used for `time.LoadLocation`.

This README provides a concise yet comprehensive overview of the `time` package. For advanced use cases, refer to the official Go documentation.