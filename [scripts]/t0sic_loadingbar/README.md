# t0sic_loadingbar

### Features
- A loadingbar that will execute a callback after a certain amount of time.

## Download & Installation

### Using Git
```
cd resources
git clone https://github.com/qalle-fivem/t0sic_loadingbar
```

### Manually
- Download from this.

## Installation
- Add this to your `server.cfg`:

```
start t0sic_loadingbar
```

## Example

* This will make a progressbar with the title ``Taking bandage...`` and it will execute ``SetEntityHealth`` after ``10000ms``

```lua
    exports["t0sic_loadingbar"]:StartDelayedFunction("Taking bandage...", 10000, function()
        SetEntityHealth(PlayerPedId(), GetPedMaxHealth(PlayerPedId()))
    end)
```

![Loadingbar](https://godhatesfags.church/dCiAZiBoMpZRfVx.png)


