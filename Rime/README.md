# rimeconfig

> rime input method configuration

## Usage

Pre-requisite:

- install rime input method, check [here](https://rime.im/download/).
- install the fonts:
  - `brew install --cask font-departure-mono-nerd-font`
  - `brew install --cask font-ark-pixel-12px-proportional`
  - [MiSans L3](https://hyperos.mi.com/font/zh/rare-word/)

Then use `./install.sh` to install the configuration for the first run.

After that, you can use `make xxx` to update the `rime-ice`.

## Custom Phrases

After running `./install.sh`, you can edit `./custom_phrase.txt` to add your custom phrases. Each line should contain a phrase and its corresponding input code, separated by a tab. For example:

```
大家好	hello
再見	bye
再會	bye
```
